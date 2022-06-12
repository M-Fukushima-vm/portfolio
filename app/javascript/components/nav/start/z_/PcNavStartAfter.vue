// (ログイン後)navバーのstartボタン箇所に置き換える ユーザーinfo の.vue
// メニュークリックで Logoutボタン と editボタンを展開

<template>
  <div>
    <v-list-item>
      <v-list-item-icon class="ml-n2">
        <v-list-item-avatar>
          <v-img src="https://randomuser.me/api/portraits/women/85.jpg"></v-img>
        </v-list-item-avatar>
      </v-list-item-icon>

      <v-list-item-icon
        class="ml-9"
        @click="pushMenuOpen"
      >
        <v-btn
          icon
        >
          <div>
            <v-icon>mdi-dots-vertical-circle-outline</v-icon>
            <v-list-item-title class="text-caption">menu</v-list-item-title>
          </div>
        </v-btn>
      </v-list-item-icon>

      <v-spacer></v-spacer>

      <v-list-item-icon
        v-show="pushMenu"
      >
        <v-btn
          icon
          color="error darken-1"
          @click="logout"
        >
          <div>
            <v-icon>mdi-logout-variant</v-icon>
            <v-list-item-title class="text-caption">logout</v-list-item-title>
          </div>
        </v-btn>
      </v-list-item-icon>

    </v-list-item>

    <v-list-item>
      <v-list-item-content class="my-2">
        <v-list-item-title class="text-h6">
          <!-- Sandra Adams -->
          {{ user.name }}
        </v-list-item-title>
        <v-list-item-subtitle>
          <!-- sandra_a88@gmail.com -->
          {{ user.email }}
        </v-list-item-subtitle>
      </v-list-item-content>

      <v-list-item-icon
        v-show="pushMenu"
        class="mt-4"
      >
        <v-btn
          icon
        >
          <div>
            <v-icon>mdi-playlist-edit</v-icon>
            <v-list-item-title class="text-caption">edit</v-list-item-title>
          </div>
        </v-btn>
      </v-list-item-icon>
    </v-list-item>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        pushMenu: false,
        user: "",
      }
    },
    methods: {
      pushMenuOpen() {
        this.pushMenu = !this.pushMenu;
      },
      logout() {
        if (confirm("ログアウトしますか？")) {
          this.$store.dispatch("auth/logout");
        }
      },
    },
    created() {
      this.user = this.$store.getters["auth/currentUser"];
    }
  }
</script>

<style lang="scss" scoped>

</style>