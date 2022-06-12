// (非ログイン時)navバーのstartボタンを担当する.vue
// クリックでログインフォームを展開

<template>
  <div>
    <v-list-item
      link
      class="py-1 my-3"
      @click="toggleLoginForm"
    >
      <v-list-item-icon class="justify-center align-center">
        <div class="text-center">
          <v-icon>
            mdi-login-variant
          </v-icon>
          <v-list-item-subtitle class="text-caption">start</v-list-item-subtitle>
        </div>
      </v-list-item-icon>
      <v-list-item-subtitle></v-list-item-subtitle>
    </v-list-item>

    <v-dialog
      v-model="toggleLoginFlag"
      hide-overlay
      width="300px"
    >
      <pc-nav-start-before-login class="justify-center"
        @closeForm="toggleLoginForm"
      ></pc-nav-start-before-login>
    </v-dialog>
  </div>
</template>

<script>
  import PcNavStartBeforeLogin from '@/components/nav/start/yz_/PcNavStartBeforeLogin'

  export default {
    components: {
      PcNavStartBeforeLogin,
    },
    data() {
      return {
        toggleLoginFlag: false,
      }
    },
    methods: {
      toggleLoginForm(){
        this.toggleLoginFlag = !this.toggleLoginFlag;
      },
    },
  }
</script>

<style lang="scss" scoped>

</style>