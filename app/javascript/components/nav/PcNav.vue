// navバーの親 切り出した中身(各フォルダ)を統合する.vue

<template>
  <v-card>
    <v-navigation-drawer
      class="transparent"
      app
      mini-variant
      :expand-on-hover="expandOn"
    >

      <v-list
        nav
        dense
      >
        <pc-nav-start></pc-nav-start>

        <v-divider></v-divider>

        <pc-nav-link></pc-nav-link>

      </v-list>
    </v-navigation-drawer>
  </v-card>
</template>

<script>
  import PcNavStart from '@/components/nav/start/PcNavStart'
  import PcNavLink from '@/components/nav/link/PcNavLink'
  export default {
    components: {
      PcNavStart,
      PcNavLink,
    },
    computed: {
      expandOn(){
        if (this.$store.getters['auth/currentUser']) {
          return true;
        }
      }
    },
  }
</script>

<style lang="scss" scoped>

</style>