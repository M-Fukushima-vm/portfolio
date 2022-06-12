// (非ログイン時)navバーのstartボタンで展開する ログインフォームの.vue

<template>
  <v-list-item class="pa-7" :style="{ background: 'rgba(247, 247, 247, 0.7)' }">
    <v-card outlined color="transparent">
      <v-form ref="form1" lazy-validation class="mt-n1 mb-3">
        <v-text-field class="py-2 mr-2"
          v-model="email"
          :rules="emailRules"
          label="e-mail:"
          dense
          required
          prepend-icon="mdi-email-outline"
          hint="アカウント認証・登録に必要"
          persistent-hint
        ></v-text-field>

        <v-text-field class="py-2 mr-2"
          v-model="password"
          :rules="passwordRules"
          :append-icon="passToggle.icon"
          @click.append="showPassword = !showPassword"
          autocomplete="on"
          label="password:"
          dense
          required
          prepend-icon="mdi-lock-outline"
          hint="行内クリックで内容確認できます"
          persistent-hint
          counter
          :type="passToggle.type"
        ></v-text-field>

        <v-card-text
          class="text-caption secondary--text text-center mt-n3 mb-n6"
          v-show="password"
        >
          <span class="text-caption info--text text--darken-3">
            初回は Signin
          </span>から登録して下さい
        </v-card-text>
      </v-form>

      <v-card-actions class="mt-n3 mb-n4">
        <v-spacer></v-spacer>

        <v-btn icon
          color="success darken-1"
          @click="login"
        >
          <div>
            <v-icon>mdi-arrow-right-circle</v-icon>
            <v-list-item-title class="text-caption">login</v-list-item-title>
          </div>
        </v-btn>

        <v-spacer></v-spacer>
      </v-card-actions>

      <v-form ref="form2" lazy-validation class="mt-2 mb-3">
        <v-text-field class="py-2 mr-2"
          v-model="name"
          :rules="nameRules"
          label="name:"
          dense
          required
          prepend-icon="mdi-account-outline"
          hint="Signinには追加で入力必須"
          persistent-hint
        ></v-text-field>
      </v-form>
      
      <v-card-actions class="mt-n2 mb-n3">
        <v-spacer></v-spacer>
        <v-btn icon
          color="info"
          @click="signin"
        >
          <div>
            <v-icon>mdi-check-circle</v-icon>
            <v-list-item-title class="text-caption">signin</v-list-item-title>
          </div>
        </v-btn>

        <v-spacer></v-spacer>

        <v-btn icon
          @click="closeForm"
        >
          <div>
            <v-icon>mdi-close</v-icon>
            <v-list-item-title class="text-caption">cancel</v-list-item-title>
          </div>
        </v-btn>

        <v-spacer></v-spacer>
      </v-card-actions>

    </v-card>
  </v-list-item>
</template>

<script>
  import axios from 'axios'
  export default {
    data: () => ({
      email: "",
      password: "",
      name: "",
      showPassword: false,
    }),
    computed: {
      passToggle () {
        const icon = this.showPassword ? 'mdi-eye' : 'mdi-eye-off'
        const type = this.showPassword ? 'text' : 'password'
        return { icon, type }
      },
      emailRules() {
        return [
          (v) => !!v || "Loginには入力必須です",
          (v) => /.+@.+\..+/.test(v) || "有効なアドレスを入力してください",
        ];
      },
      passwordRules() {
        return [
          (v) => !!v || "Loginには入力必須です",
          (v) => v.length >= 4 || "4文字以上で設定してください",
        ];
      },
      nameRules() {
        return [(v) => !!v || "Signinには入力必須です"];
      },
    },
    methods: {
      async login() {
        if (this.$refs.form1.validate()) {
          try {
            const sessionParams = {
              session: {
                email: this.email.toLowerCase(),
                password: this.password,
              },
            };
            await this.$store.dispatch("auth/login", sessionParams);
            this.$emit("closeForm");
          } catch (error) {
            alert(error.response.data.error.messages);
          }
        }
      },
      async signin() {
        if (this.$refs.form2.validate()) {
          try {
            const userParams = {
              user: {
                email: this.email.toLowerCase(),
                password: this.password,
                name: this.name,
              },
            };
            await axios.post(`/api/users`, userParams);
            this.login();
          } catch(err) {
            alert(err.response.data.error.messages);
          }
        }
      },
      closeForm(){
        this.$emit("closeForm");
      }
    },
  }
</script>

<style lang="scss" scoped>

</style>