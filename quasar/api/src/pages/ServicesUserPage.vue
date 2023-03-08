<template>
        <div class="text-h6">Services</div>
        <q-table
          :rows="services"
          :columns="servicesColumns"
          :rows-per-page-options="[0]"
          :loading="loading"
          row-key="id">
          <template v-slot:body="props">
            <q-tr :props="props">
              <q-td v-for="col in props.cols" :key="col.name" :props="props">
                <q-item v-if="col.name === 'name' && !props.row.name.includes('.')">
                  <q-item-section>
                    <q-item-label><a href="#">{{ props.row[col.name] }} (Extra)</a></q-item-label>
                  </q-item-section>
                </q-item>
                <q-item v-else>
                  <q-item-section>
                    <q-item-label>{{ props.row[col.name] }}</q-item-label>
                  </q-item-section>
                </q-item>
              </q-td>
            </q-tr>
          </template>
        </q-table>
</template>

<script>
export default {
  name: "ServicesUserPage",
  data() {
    return {
      services: [],
      loading: false,
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
          name: "Actions",
          field: "actions",
          align: "left",
          label: "Actions",
        }
      ],

    };
  },
  methods: {
    getServices() {
      let id = this.$route.params.id;
      this.loading = true;
      this.$axios
        .get(process.env.API + "/user/" + id + "/services")
        .then(async (response) => {
          console.log(response.data)
          let serviceMap = await response.data.map((service) => {
            return {
              id: service.id,
              name: service.name_domain + service.article.value_property,
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
        .catch((error) => {
          console.log(error);
        });
    },
  },
  mounted() {
    this.getServices();
  },
}
</script>

<style scoped>

</style>
