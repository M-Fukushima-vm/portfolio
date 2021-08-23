// navバーのstartボタン(ログイン状況で分ける)を統合する.vue
// ・非ログイン時 → startボタン  ・ログイン後 → ユーザーinfo

<template>
  <div>
    <pc-nav-start-before
      v-if="!$store.getters['auth/currentUser']"
    ></pc-nav-start-before>

    <pc-nav-start-after
      v-if="$store.getters['auth/currentUser']"
    ></pc-nav-start-after>
  </div>
</template>

<script>
  import PcNavStartBefore from '@/components/nav/start/z_/PcNavStartBefore'
  import PcNavStartAfter from '@/components/nav/start/z_/PcNavStartAfter'
  export default {
    components: {
      PcNavStartBefore,
      PcNavStartAfter,
    },
  }
</script>

<style lang="scss" scoped>

</style>