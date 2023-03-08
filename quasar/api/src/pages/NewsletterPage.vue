<template>
  <div class="q-pa-md">
    <q-table
      :rows="rowsFiltered"
      :columns="columns"
      row-key="id"
      v-model:pagination="pagination"
      :rows-per-page-options="[0]"
      :loading="loading"
      :search="search"
      >
      <template v-slot:top>
        <q-toolbar>
          <q-toolbar-title>Newsletter</q-toolbar-title>
          <q-space />
          <q-input
            v-model="search"
            dense
            rounded
            debounce="500"
            placeholder="Search"
            @update:model-value="searchEmail"
          >
            <template v-slot:before>
              <q-icon name="search" />
            </template>
            <template v-slot:after>
              <q-btn
                icon="delete"
                color="red"
                inverted
                @click="confirm = true"
              />
            </template>
          </q-input>
        </q-toolbar>
      </template>
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td v-for="col in props.cols" :key="col.name" :props="props">
            <q-item v-if="col.name === 'selected'">
              <q-item-section avatar>
                <q-checkbox
                  v-model="props.row.selected"
                  dense
                  color="red"
                />
              </q-item-section>
            </q-item>
            <q-item v-else>
              <q-item-section>
                {{ col.value }}
              </q-item-section>
            </q-item>
          </q-td>
        </q-tr>
      </template>
    </q-table>
  </div>
  <q-dialog v-model="confirm" persistent>
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="delete" color="primary" text-color="white" />
          <span class="q-ml-sm">Are you sure you want to delete those emails?</span>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="Cancel" color="primary" v-close-popup />
          <q-btn flat label="Delete" color="red" v-close-popup @click="deleteSelected"/>
        </q-card-actions>
      </q-card>
    </q-dialog>
</template>

<script>
import {ref} from "vue";
import { useQuasar } from "quasar";
import axios from "axios";

export default {
  name: "NewsletterPage",
  data() {
    return {
      alert: ref(false),
      confirm: ref(false),
      prompt: ref(false),
      search: "",
      rowsFiltered: [],
      rows: [],
      loading: false,
      columns: [
        {
          name: "email",
          label: "E-mail",
          field: row => row.email,
          align: "left",
          sortable: true,
        },
        {
          name: "selected",
          label: "Select",
          field: row => row.selected,
          align: "left",
        },
      ],
      pagination: ref({
        rowsPerPage: 10,
      })
    };
  },
  setup() {
    const  q  = useQuasar();
    return {
      q,
      showNotificationDelete() {
        q.notify({
          message: "Email(s) deleted",
          color: "positive",
          position: "bottom",
          timeout: 10000,
          icon: 'check_circle',
          actions: [{ icon: "close", color: "white", label: "Close", handler: () => {
              console.log("Close notification");
            }
          }],
        });
      }
    };
  },
  methods: {
    async load() {
      this.loading = true;
      const response2 = await axios.get(process.env.API + "/newsletter");
      let newsletterMap = await response2.data;
      this.rows = newsletterMap.map((newsletter) => {
        return {
          id: newsletter.id,
          email: newsletter.email,
          selected: false
        };
      });
      this.loading = false;
      return this.rows;
    },
    searchEmail() {
      this.rowsFiltered = this.rows.filter((row) => {
        return row.email.toLowerCase().includes(this.search.toLowerCase());
      });
    },
    deleteSelected() {
      const emailsToDelete = [];
      this.rows = this.rows.filter((row) => {
        if (row.selected) {
          emailsToDelete.push(row.id);
        }
        return !row.selected;
      });
      this.deleteEmails(emailsToDelete);
    },
    async deleteEmails(emailsToDelete) {
      for (let i = 0; i < emailsToDelete.length; i++) {
        await axios.delete(process.env.API + "/newsletter/" + emailsToDelete[i])
          .then((response) => {
            if (response.status === 200) {
              console.log("Email(s) deleted");
              this.rowsFiltered = this.rows;
            }
          })
          .catch((error) => {
            console.log(error);
          });
      }
      this.showNotificationDelete();
    },
  },
  async mounted() {
    this.rowsFiltered = await this.load();
  }
}
</script>

<style scoped>

</style>
