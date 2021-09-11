// (ログイン後)navバーのstartボタン箇所に置き換える ユーザーinfo の.vue
// メニュークリックで Logoutボタン と editボタンを展開

<template>
  <div>
    <v-list-item>
      <v-list-item-icon class="ml-n2 pt-1">
        <v-list-item-avatar>
          <v-img
            :src="$store.getters['auth/currentUserAvatar']"
            v-if="$store.getters['auth/currentUserAvatar']"
            ></v-img>

          <v-avatar
            color="primary"
            size="40"
            v-if="!$store.getters['auth/currentUserAvatar'] && user.avatar_name"
          >
            <span class="white--text text-sm">{{ user.avatar_name }}</span>
          </v-avatar>

          <v-avatar
            color="primary lighten-1"
            size="40"
            v-if="!$store.getters['auth/currentUserAvatar'] && !user.avatar_name"
          >
            <v-icon
              class="white--text text-sm"
            >mdi-account</v-icon>
          </v-avatar>
        </v-list-item-avatar>
      </v-list-item-icon>

      <v-list-item-icon
        class="ml-9"
        @click="pushMenuOpen"
      >
        <v-btn
          icon
        >
          <div class="text-subtitle-2">
            <v-icon>mdi-dots-vertical-circle-outline</v-icon>
            <v-list-item-title class="text-caption">
              menu
            </v-list-item-title>
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
      <v-list-item-content class="mt-2">
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
          @click="pushEditOpen"
        >
          <div>
            <v-icon>mdi-playlist-edit</v-icon>
            <v-list-item-title class="text-caption">edit</v-list-item-title>
          </div>
        </v-btn>
      </v-list-item-icon>
    </v-list-item>

    <v-dialog
      v-model="toggleEditFlag"
      hide-overlay
      width="320px"
    >
      <pc-nav-start-after-edit class="justify-center"
        @closeForm="pushEditOpen"
      ></pc-nav-start-after-edit>
    </v-dialog>
  </div>
</template>

<script>
  import PcNavStartAfterEdit from '@/components/nav/start/yz_/PcNavStartAfterEdit'

  export default {
    components: {
      PcNavStartAfterEdit,
    },
    data() {
      return {
        pushMenu: false,
        user: "",
        toggleEditFlag: false,
      }
    },
    computed: {
      userState() {
        return this.$store.getters["auth/currentUser"]
      },
    },
    watch: {
      userState() {
        this.$nextTick(() => {
          this.user = this.userState;
        })
      },
    },
    methods: {
      pushMenuOpen() {
        this.pushMenu = !this.pushMenu;
      },
      pushEditOpen() {
        this.toggleEditFlag = !this.toggleEditFlag;
        this.pushMenuOpen();
      },
      logout() {
        if (confirm("ログアウトしますか？")) {
          this.$store.dispatch("auth/logout");
          this.pushMenuOpen();
        }
      },
    },
    created() {
      this.user = this.userState;
    }
  }
</script>

<style lang="scss" scoped>

</style>