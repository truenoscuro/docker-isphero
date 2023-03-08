<template>
  <q-table
    :rows="propertyList"
    :columns="propertyColumns"
    row-key="id">
    <template #top>
      <q-btn
        color="primary"
        text-color="white"
        label="Add Property"
        @click="() => $router.push({name: 'AddPropertyPage'})"
      />
    </template>
  </q-table>

</template>

<script>
export default {
  name: "PropertiesList",
  data() {
    return {
      propertyList: [],
      propertyColumns: [
        {
          name: "name",
          label: "Name",
          field: "name",
          align: "left",
          sortable: true,
        },
        {
          name: "type",
          label: "Type",
          field: "type",
          align: "left",
          sortable: true,
        },
        {
          name: "Actions",
          field: "actions",
          align: "left",

        }
      ]
    }
  },
  methods: {
    async getProperties() {
      this.$axios.get(process.env.API + "/properties")
        .then(response => {
          this.propertyList = response.data
        })
        .catch(error => {
          console.log(error)
        })
    }
  },
  mounted() {
    this.getProperties()
  }
}
</script>

<style scoped>

</style>
