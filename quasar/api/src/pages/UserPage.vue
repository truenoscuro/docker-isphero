<template>
  <div class="q-pa-md">
  <q-markup-table
  >
    <q-tr>
      <q-th colspan="7">
        <div class="row no-wrap items-center">
          <div class="col">
            <q-input
              v-model="search"
              debounce="500"
              rounded
              dense
              placeholder="Search"
              color="blue-5"
              inverted
              class="text-white"
              @update:model-value="filterUsers"
            >
              <template v-slot:before>
                <q-icon name="person" />
              </template>
              <template v-slot:after>
                <div>
                  <q-btn icon="mic" color="green" v-if="!isRecording" @click="startRecording" />
                  <q-btn icon="stop" color="red" v-else @click="stopRecording" />
                </div>
              </template>
            </q-input>
          </div>
        </div>
      </q-th>
    </q-tr>
    <q-tr>
      <q-th>ID</q-th>
      <q-th>Name</q-th>
      <q-th>Last name</q-th>
      <q-th>Username</q-th>
      <q-th>Email</q-th>
      <q-th>Role</q-th>
      <q-th>Actions</q-th>
    </q-tr>
    <q-tr v-for="user in usersFiltered" :key="user.id" class="text-center">
      <q-td>{{ user.id }}</q-td>
      <q-td>{{ user.first_name }}</q-td>
      <q-td>{{ user.last_name1 }}</q-td>
      <q-td>{{ user.username }}</q-td>
      <q-td>{{ user.email }}</q-td>
      <q-td>{{ user.role }}</q-td>
      <q-td>
        <q-btn color="green-5" icon="edit" @click="editUser(user.id)" class="q-mx-xs">
          <q-tooltip class="bg-black" :offset="[10, 10]">Edit</q-tooltip>
        </q-btn>
        <q-btn color="negative" icon="delete" @click="confirm = true; setDeleteId(user.id)" class="q-mx-xs">
          <q-tooltip class="bg-black" :offset="[10, 10]">Delete</q-tooltip>
        </q-btn>
        <q-btn color="black" icon="vpn_key" @click="showServices(user.id)" class="q-mx-xs">
          <q-tooltip class="bg-red" :offset="[10, 10]">Services</q-tooltip>
        </q-btn>
      </q-td>
    </q-tr>
  </q-markup-table>
    <div class="row justify-end">
      <q-btn
        color="primary"
        label="Export to PDF"
        icon="picture_as_pdf"
        @click="exportToPdf"
      />
    </div>
  <q-dialog v-model="confirm" persistent>
    <q-card>
      <q-card-section class="row items-center">
        <q-avatar icon="delete" color="primary" text-color="white" />
        <span class="q-ml-sm">Are you sure you want to delete this user?</span>
      </q-card-section>

      <q-card-actions align="right">
        <q-btn flat label="Cancel" color="primary" v-close-popup />
        <q-btn flat label="Delete" color="red" v-close-popup @click="deleteUser"/>
      </q-card-actions>
    </q-card>
  </q-dialog>
    <q-page-sticky position="bottom-right" :offset="[18, 50]">
      <q-btn fab icon="add" color="green-7" @click="editUser('new')">
        <q-tooltip class="bg-black" :offset="[10, 10]">Add</q-tooltip>
      </q-btn>
    </q-page-sticky>
  </div>
</template>

<script>
import {ref} from "vue";
import {QSpinnerFacebook, useQuasar, exportFile} from "quasar";
import axios from "axios";
import { jsPDF } from "jspdf";
import autoTable from 'jspdf-autotable';


export default {
  name: "UserPage",
  components: {

  },
  data() {
    return {
      alert: ref(false),
      confirm: ref(false),
      prompt: ref(false),
      search: "",
      users: [],
      usersFiltered: [],
      deleteId: null,
      responseMessage: null,
      colorMessage: null,
      isRecording: false,
      mediaRecorder: null,
      chunks: [],
      stream: null,
    };
  },
  methods: {
    async startRecording() {
      this.isRecording = true;
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
      this.mediaRecorder = new MediaRecorder(stream);
      this.mediaRecorder.addEventListener("dataavailable", (event) => {
        if (event.data.size > 0) {
          this.chunks.push(event.data);
        }
      });
      this.mediaRecorder.start();
      this.stream = stream;
    },
    stopRecording() {
      this.isRecording = false;
      this.mediaRecorder.stop();
      this.stream.getTracks().forEach((track) => {
        track.stop();
      });
      this.sendRecording();
    },
    async sendRecording() {
      const blob = new Blob(this.chunks, { type: "audio/webm" });
      const formData = new FormData()
      formData.append("arxiu", blob, "stuffToTranscribe.webm")
      const response = await fetch('https://theteacher.codiblau.com/piano/nologin/google/transcribe', {
        method: 'POST',
        body: formData,
      })
      const data = await response.json()
      if (data.confianca > 0.7) {
        this.search = data.text
      } else {
        this.$q.notify({
          message: 'No se ha podido reconocer la búsqueda',
          color: 'red',
          position: 'top',
          timeout: 2000,
        })
      }
    },
    setDeleteId(id) {
      this.deleteId = id;
    },
    async getUsers() {
      this.$q.loading.show({
        message: 'Loading data ...',
        spinnerSize: 150,
        spinner: QSpinnerFacebook,
        backgroundColor: 'blue-7',
        spinnerColor: 'orange-7',
      })
      const response = await axios.get(`${process.env.API}/users`);
      let userMap = await response.data;
      this.users = userMap.map((user) => {
        return {
          id: user.id,
          first_name: user.user_data ? user.user_data.first_name ? user.user_data.first_name : " - " : " - ",
          last_name1: user.user_data ? user.user_data.last_name1 ? user.user_data.last_name1 : " - " : " - ",
          username: user.username,
          email: user.email,
          role: user.role,
        };
      });
      this.$q.loading.hide();
      return this.users;
    },
    filterUsers() {
      this.usersFiltered = this.users.filter((user) => {
        return (
          user.first_name.toLowerCase().includes(this.search.toLowerCase()) ||
          user.last_name1.toLowerCase().includes(this.search.toLowerCase()) ||
          user.username.toLowerCase().includes(this.search.toLowerCase()) ||
          user.email.toLowerCase().includes(this.search.toLowerCase()) ||
          user.role.toLowerCase().includes(this.search.toLowerCase())
        );
      });
    },
    async deleteUser() {
      this.$q.notify({
        message: "Deleting user...",
        color: "primary",
        position: "bottom",
        timeout: 1000,
      });
      let int = await axios.delete(`${process.env.API}/user/${this.deleteId}`)
        .then(async (response) => {
          if (response.status === 200) {
            this.responseMessage = "User deleted successfully";
            this.colorMessage = "positive";
            this.showNotificationDelete()
            this.usersFiltered = await this.getUsers();
          }
          if (response.status === 403) {
              this.responseMessage = data.message;
              this.colorMessage = "negative";
              this.showNotificationDelete()
          }
        })
        .catch((error) => {
          this.responseMessage = error.response.data.message;
          this.colorMessage = "negative";
          this.showNotificationDelete()
        });
    },
    editUser(id) {
      this.$router.push(`/home/edit-user/${id}`)
    },
    showServices(id) {
      this.$router.push(`/home/services/${id}`)
    },
    exportToPdf() {
      const doc = new jsPDF({
        orientation: "landscape",
        unit: "mm",
        format: "a4",
      });
      doc.text("Users", 10, 10);
      autoTable(doc, {
        head: [
          ["First Name", "Last Name", "Username", "Email", "Role"],
        ],
        body: this.usersFiltered.map((user) => {
          return [
            user.first_name,
            user.last_name1,
            user.username,
            user.email,
            user.role,
          ];
        }),
      });
      doc.save(`Users-${new Date().toISOString()}.pdf`);
    },
  },
  setup() {
    const  q  = useQuasar();
    return {
      showNotificationDelete() {
        q.notify({
          message: this.responseMessage,
          color: this.colorMessage,
          position: "bottom",
          timeout: 5000,
          icon: 'person',
          actions: [{ icon: "close", color: "white", label: "Close"}],
        });
      },
    }
  },
  async mounted() {
    this.usersFiltered = await this.getUsers();
  },
}
</script>

<style scoped>
</style>
