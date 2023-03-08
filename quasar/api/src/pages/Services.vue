<template>
      <q-tabs v-model="activeTab" @input="changeTab" active-color="blue" indicator-color="white">
        <q-tab name="tab1">
          Services
        </q-tab>
        <q-tab name="tab2">
          Extras
        </q-tab>
      </q-tabs>
        <div v-if="activeTab === 'tab1'">
          <q-table
            :rows="services"
            :columns="servicesColumns"
            v-model:pagination="pagination"
            :rows-per-page-options="[0]"
            :loading="loading"
            row-key="id"
          >
          </q-table>
        </div>
        <div v-if="activeTab === 'tab2'">
          <q-table
            :data="extras"
            :columns="extrasColumns"
            row-key="id"
          />
        </div>
</template>

<script>
import {ref} from "vue";

export default {
  name: "Services",
  data() {
    return {
      pagination: ref({
        rowsPerPage: 10,
      }),
      services: [],
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
      extras: [],
      extrasColumns: [
        {
          name: "name",
          label: "Name",
          field: "name",
          align: "left",
          sortable: true,
        },
        {
          name: "price",
          label: "Price",
          field: "price",
          align: "left",
          sortable: true,
        },
      ],
      activeTab: "tab1",
      loading: false,
    }
  },
  methods: {
    getServices() {
      this.loading = true;
      this.$axios.get(process.env.API + "/services")
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
        serviceMap.forEach((service) => {
          let dateFormat = new Date(service.expiry_date);
          service.expiry_date = dateFormat.getFullYear() + "-" + (dateFormat.getMonth() + 1) + "-" + dateFormat.getDate();
        })
        this.loading = false;
        this.services = serviceMap;
      })
    },
    changeTab(tab) {
      this.activeTab = tab;
    },
  },
  mounted() {
    this.getServices();
  },
}
</script>

<style scoped>

</style>
