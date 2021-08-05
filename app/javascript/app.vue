<template>
  <v-app id="app" :style="{ background: 'linear-gradient(165deg, #fdfdfd 0%, #edeff1 100%)' }">
    <p class="primary--text">{{ message }}</p>
    <p>{{ message }}</p>
    <v-btn small>ボタン</v-btn>
    <v-btn small color="primary">Primary</v-btn>
    <v-btn small color="accent">Accent</v-btn>
    <v-btn small color="secondary">Secondary</v-btn>
    <v-btn small color="error">Error</v-btn>
    <v-btn small color="warning">Warning</v-btn>
    <v-btn small color="info">Info</v-btn>
    <v-btn small color="success">Success</v-btn>
  </v-app>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
