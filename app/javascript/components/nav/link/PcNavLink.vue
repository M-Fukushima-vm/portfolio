// navバーのlinkを統合する.vue

<template>
  <div>
    <top-link
      v-if="!$store.getters['auth/currentUser']"
    >
    </top-link>
    <user-home
      v-if="$store.getters['auth/currentUser']"
    >
    </user-home>
  </div>
</template>

<script>
  import TopLink from '@/components/nav/link/z_/TopLink'
  import UserHome from '@/components/nav/link/z_/UserHome'
  export default {
    components: {
      TopLink,
      UserHome,
    }
  }
</script>

<style lang="scss" scoped>

</style>