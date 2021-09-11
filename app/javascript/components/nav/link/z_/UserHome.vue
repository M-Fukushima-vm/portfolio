<template>
  <div>
    <v-list-item link class="py-1 my-3">
      <v-list-item-icon class="justify-center align-center">
        <div class="text-center">
          <v-icon>
            mdi-share-variant-outline
          </v-icon>
          <v-list-item-subtitle class="text-caption">
            Maps
          </v-list-item-subtitle>
        </div>
      </v-list-item-icon>
      <v-list-item-subtitle>マップ一覧</v-list-item-subtitle>
    </v-list-item>

    <v-list-item link class="py-1 my-3">
      <v-list-item-icon class="justify-center align-center">
        <div class="text-center">
          <v-icon>
            <!-- mdi-view-dashboard-outline -->
            mdi-vector-polyline
          </v-icon>
          <v-list-item-subtitle class="text-caption">
            Unit
          </v-list-item-subtitle>
        </div>
      </v-list-item-icon>
      <v-list-item-subtitle>メモ(ユニット)一覧</v-list-item-subtitle>
    </v-list-item>

    <v-list-item link class="py-1 my-3">
      <v-list-item-icon class="justify-center align-center">
        <div class="text-center">
          <v-icon>
            mdi-text-box-outline
          </v-icon>
          <v-list-item-subtitle class="text-caption">
            Single
          </v-list-item-subtitle>
        </div>
      </v-list-item-icon>
      <v-list-item-subtitle>メモ(シングル)一覧</v-list-item-subtitle>
    </v-list-item>

    <v-divider></v-divider>

    <v-list-item link class="py-1 my-3">
      <v-list-item-icon class="justify-center align-center">
        <div class="text-center">
          <v-icon>
            mdi-emoticon-kiss-outline
          </v-icon>
          <v-list-item-subtitle class="text-caption">
            Friends
          </v-list-item-subtitle>
        </div>
      </v-list-item-icon>
      <v-list-item-subtitle>フレンド一覧</v-list-item-subtitle>
    </v-list-item>

    <!-- <v-list-item link>
      <v-list-item-icon>
        <v-icon>mdi-star</v-icon>
      </v-list-item-icon>
      <v-list-item-title>Starred</v-list-item-title>
    </v-list-item> -->
  </div>
</template>

<script>
  export default {
    
  }
</script>

<style lang="scss" scoped>

</style>