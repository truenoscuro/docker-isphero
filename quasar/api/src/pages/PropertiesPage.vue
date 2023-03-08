<template>
  <q-page padding>
    <h2>Properties</h2>
    <PropertiesList />
  </q-page>
</template>

<script>
import PropertiesList from "components/PropertiesList.vue";

export default {
  name: "PropertiesPage",
  components: {PropertiesList},
}
</script>

<style scoped>

</style>
