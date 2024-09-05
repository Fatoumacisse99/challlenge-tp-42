<template>
  <div class="container">
    <h2>Détails de la Recette</h2>
    <div v-if="recette">
      <p><strong>Titre:</strong> {{ recette.titre }}</p>
      <p><strong>Ingrédients:</strong> {{ recette.ingredients }}</p>
      <p><strong>Type:</strong> {{ recette.type }}</p>
    </div>
    <div v-else>
      <p>La recette n'a pas été trouvée.</p>
    </div>
    <router-link to="/recette-list" class="btn btn-secondary">Retour à la liste</router-link>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';
import { useRecetteStore } from '@/store/recetteStore';

const route = useRoute();
const store = useRecetteStore();
const recette = ref(null);

onMounted(() => {
  const id = parseInt(route.params.id);
  recette.value = store.getById(id);
});
</script>
