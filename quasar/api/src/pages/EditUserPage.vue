<template>
  <q-page padding>
    <q-card>
      <q-card-section>
        <div class="text-h6">Edit User with ID: {{id}}</div>
      </q-card-section>
      <q-card-section>
        <q-form>
          <!-- Form with 2 columns -->
          <div class="row justify-evenly">
            <div class="col-12 col-md-5">
              <q-input
                v-model="username"
                label="Username"
                value= username
                filled
                lazy-rules
                :rules="[val => val.length > 0 || 'Please type a username']">
                <template v-slot:before>
                  <q-icon name="account_circle" />
                </template>
              </q-input>
              <q-input
                v-model="user_data.first_name"
                label="Name"
                filled
                value= firstName
                lazy-rules
                :rules="[val => val.length > 0 || 'Please type a name']">
                <template v-slot:before>
                  <q-icon name="person" />
                </template>
              </q-input>
              <q-input
                v-model="user_data.last_name1"
                label="Last Name"
                value= lastName
                filled
                lazy-rules
                :rules="[val => val.length > 0 || 'Please type a name']">
                <template v-slot:before>
                  <q-icon name="person_outline" />
                </template>
              </q-input>
              <q-input
                v-model="email"
                label="E-mail"
                value= email
                filled
                lazy-rules
                :rules="[val => val.length > 0 || 'Please type an e-mail']">
                <template v-slot:before>
                  <q-icon name="mail" />
                </template>
              </q-input>
            </div>
            <div class=" col-12 col-md-5">
              <q-input
                v-model="user_data.address"
                label="Address"
                value= address
                filled
                lazy-rules
                :rules="[val => val.length > 0 || 'Please type an address']">
                <template v-slot:before>
                  <q-icon name="home" />
                </template>
              </q-input>
              <q-input
                v-model="user_data.city"
                label="City"
                value= city
                filled
                lazy-rules
                :rules="[val => val.length > 0 || 'Please type a city']">
                <template v-slot:before>
                  <q-icon name="location_city" />
                </template>
              </q-input>
              <q-input
                v-model="user_data.postal_code"
                label="Post Code"
                value= postCode
                filled
                lazy-rules
                :rules="[val => val.length > 0 || 'Please enter a post code']">
                <template v-slot:before>
                  <q-icon name="tag" />
                </template>
              </q-input>
              <q-select
                v-model="role"
                label="Role"
                filled
                :options="['ADMIN', 'USER']"
                lazy-rules
                :rules="[val => val.length > 0 || 'Please select a role']">
                <template v-slot:before>
                  <q-icon name="admin_panel_settings" />
                </template>
              </q-select>
            </div>
          </div>
          <div class="flex justify-evenly">
            <q-btn
              label="Cancel"
              color="negative"
              class="self-center"
              @click="goBack"
              rounded
            />
            <q-btn
              label="Save"
              color="primary"
              @click="saveUser"
              class="self-center"
              rounded
            />
          </div>
        </q-form>
      </q-card-section>
    </q-card>
  </q-page>
</template>

<script>
import axios from "axios";
import {QSpinnerFacebook, QSpinnerIos} from "quasar";

export default {
  name: "EditUserPage",
  data() {
    return {
      id: this.$route.params.id,
      email: "",
      username: "",
      role: "",
      user_data: {
        user_id: "",
        first_name: "",
        last_name1: "",
        address: "",
        city: "",
        country: "",
        postal_code: "",
      }
    }
  },
  methods: {
    goBack() {
      this.$router.push("/home/users")
    },
    async getUser() {
      if (this.$route.params.id !== 'new') {
        this.$q.loading.show({
          message: 'Loading data ...',
          spinnerSize: 150,
          spinner: QSpinnerFacebook,
          backgroundColor: 'blue-7',
          spinnerColor: 'orange-7',
        })
      }
      let id = this.$route.params.id;
      if (id === "new") {
        return;
      }
      const response = await axios.get(`${process.env.API}/user/${id}`)
      let user = await response.data
      this.user_data.user_id = id
      this.user_data.first_name = user.user_data ? user.user_data.first_name : "";
      this.user_data.last_name1 = user.user_data ? user.user_data.last_name1 : "";
      this.email = user.email;
      this.verified = user.verified;
      this.user_data.address = user.user_data ? user.user_data.address : "";
      this.user_data.city = user.user_data ? user.user_data.city : "";
      this.user_data.country = user.user_data ? user.user_data.country : "";
      this.user_data.postal_code = user.user_data ? user.user_data.postal_code : "";
      this.username = user.username;
      this.role = user.role;
      this.$q.loading.hide();
    },

    async saveUser() {
      this.$q.loading.show({
        message: 'Saving data ...',
        spinnerSize: 150,
        spinner: QSpinnerIos,
        backgroundColor: 'blue-7',
        spinnerColor: 'orange-7',
      })
      let id = this.$route.params.id;
      if (id !== "new") {
        await axios.put(`${process.env.API}/user/${id}`, {
          body: ({
            username: this.username,
            email: this.email,
            role: this.role,
            userData: {
              user_id: this.user_data.user_id,
              first_name: this.user_data.first_name,
              last_name1: this.user_data.last_name1,
              address: this.user_data.address,
              city: this.user_data.city,
              country: this.user_data.country,
              postal_code: this.user_data.postal_code,
            }
          })
        }).catch(error => {
          if(error.response.status === 500) {
            this.$q.loading.hide()
            this.$q.notify({
              message: 'Error saving data : ' + error.response.data.message,
              color: 'negative',
              position: 'top',
              timeout: 2000
            })
          }
        })
        this.$q.loading.hide();
        this.$router.push("/home/users");
      }
      if (id === "new") {
        await axios.post(`${process.env.API}/user`, {
          body: ({
            email: this.email,
            role: this.role,
            username: this.username,
            userData: {
              user_id: this.user_data.user_id,
              first_name: this.user_data.first_name,
              last_name1: this.user_data.last_name1,
              address: this.user_data.address,
              city: this.user_data.city,
              country: this.user_data.country,
              postal_code: this.user_data.postal_code,
            }
          })
        }).catch(error => {
          if(error.response.status === 500) {
            this.$q.loading.hide()
            this.$q.notify({
              message: 'Error saving data : ' + error.response.data.message,
              color: 'negative',
              position: 'top',
              timeout: 2000
            })
          }
        })
        this.$q.loading.hide();
        this.$router.push("/home/users");
      }
    }
  },
  mounted() {
    this.getUser();
  }
}
</script>

<style scoped>

</style>
