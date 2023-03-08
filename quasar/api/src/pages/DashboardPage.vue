<template>
  <div class="text-h6">Services which expire soon:</div>
  <q-table
    :rows="servicesExpireSoon"
    :columns="servicesColumns"
    :rows-per-page-options="[0]"
    :loading="loading"
    row-key="id"></q-table>
  <h4>Chats</h4>
  <ChatList @chat="setChatUsername" @user-list="getUserListFromChild"/>
  <Chatwindow :user="chatWithUser" :hidden="chatHidden"/>
</template>

<script>

import axios from "axios";
import Chatwindow from "components/Chatwindow.vue";
import ChatList from "components/ChatList.vue";


export default {
  name: "DashboardPage",
  components: {ChatList, Chatwindow},
  data() {
    return {
      loading: false,
      servicesExpireSoon: [],
      chatWithUser: "alex",
      chatHidden: true,
      servicesColumns: [
        {
          name: "id",
          label: "ID",
          field: "id",
          align: "left",
          sortable: true,
        },
        {
          name: "name",
          label: "Domain",
          field: "name",
          align: "left",
          sortable: true,
        },
        {
          name: "expiry_date",
          label: "Expiry Date",
          field: "expiry_date",
          align: "left",
          sortable: true,
        },
        {
          name: "active",
          label: "Active",
          field: "active",
          align: "left",
          sortable: true,
        },
        {
          name: "user_id",
          label: "User ID",
          field: "user_id",
          align: "left",
        }
      ],
      users: []
    }
  },
  methods:{
    setChatUsername(username) {
      this.chatWithUser = username;
      this.chatHidden = false;
      this.$forceUpdate();
    },
    getUserListFromChild(userList) {
      this.users = userList;
    },
    getServicesExpireSoon() {
      this.loading = true;
      axios.get(process.env.API + "/services/expire_soon")
        .then(async (response) => {
          let serviceMap = await response.data.map((service) => {
            return {
              id: service.id,
              name: service.name_domain,
              expiry_date: service.date_expired,
              active: service.is_cancelled ? "No" : "Yes",
              user_id: service.user_id,
            }
          })
          this.loading = false;
          serviceMap.forEach((service) => {
            let date = new Date(service.expiry_date);
            service.expiry_date = date.toLocaleDateString();
          })

          this.servicesExpireSoon = serviceMap;
        })
    },
  },
  mounted() {
    this.getServicesExpireSoon();
  }
}
</script>

<style scoped>

</style>
