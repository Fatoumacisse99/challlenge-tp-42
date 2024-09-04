<!-- <template>
  <div class="container">
    <h3>Modifier une recette :</h3>
    <form @submit.prevent="onSubmit">
      <div class="mb-3">
        <label for="titre" class="form-label">Titre</label>
        <input type="text" class="form-control" id="titre" v-model="titre">
      </div>
      <div class="mb-3">
        <label for="ingredients" class="form-label">Ingredients</label>
        <input type="text" class="form-control" id="ingredients" v-model="ingredients">
      </div>
      <div class="mb-3">
        <label for="type" class="form-label">Type</label>
        <select class="form-control" id="type" v-model="type">
          <option value="dessert">Dessert</option>
          <option value="entree">Entrée</option>
          <option value="plat">Plat</option>
        </select>
      </div>
      
      <button class="btn btn-success">Enregistrer</button>
    </form>
  </div>


</template>

<script setup>
</script>

<style scoped></style> -->
<template>
  <div class="container">
    <h3>Modifier une recette :</h3>
    <form @submit.prevent="onSubmit">
      <div class="mb-3">
        <label for="titre" class="form-label">Titre</label>
        <input type="text" class="form-control" id="titre" v-model="recette.titre" required/>
      </div>
      <div class="mb-3">
        <label for="ingredients" class="form-label">Ingrédients</label>
        <input type="text" class="form-control" id="ingredients" v-model="recette.ingredients" required/>
      </div>
      <div class="mb-3">
        <label for="type" class="form-label">Type</label>
        <select class="form-control" id="type" v-model="recette.type">
          <option value="dessert">Dessert</option>
          <option value="entree">Entrée</option>
          <option value="plat">Plat</option>
        </select>
      </div>
      <button class="btn btn-success">Modifier</button>
    </form>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRouter, useRoute } from 'vue-router';
import { useRecetteStore } from '../../store/recetteStore';

const store = useRecetteStore();
const router = useRouter();
const route = useRoute();

const recette = ref({
  titre: '',
  ingredients: '',
  type: '',
});

onMounted(() => {
  const id = parseInt(route.params.id, 10);
  const existingRecette = store.getById(id);
  if (existingRecette) {
    recette.value = { ...existingRecette };
  } else {
    router.push('/recette-list');
  }
});

const onSubmit = () => {
  store.edit(recette.value.id, recette.value);
  router.push('/recette-list');
};
</script>

<style scoped></style>
