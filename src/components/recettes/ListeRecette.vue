<!-- ListeRecette.vue -->
<template>
  <div class="container">
    <h2>Liste des recettes</h2>
    <div class="d-flex justify-content-end mb-4">
      <router-link to="/recette/new" class="btn btn-danger">Nouvelle Recette</router-link>
    </div>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Titre</th>
          <th scope="col">Ingrédients</th>
          <th scope="col">Type</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in store.recettes" :key="item.id">
          <td scope="row">{{ item.id }}</td>
          <td>{{ item.titre }}</td>
          <td>{{ item.ingredients }}</td>
          <td>{{ item.type }}</td>
          <td>
            <router-link :to="`/recette/edit/${item.id}`" class="btn btn-warning btn-sm"> <i class="fas fa-edit"></i></router-link>
            <button @click="deleteRecette(item.id)" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
          
            <button @click="voirDetails(item)" class="btn btn-info btn-sm"><i class="fas fa-eye"></i></button>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- Modal pour afficher les détails de la recette -->
    <div class="modal fade" id="detailsModal" tabindex="-1" aria-labelledby="detailsModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="detailsModalLabel">Détails de la Recette</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div v-if="recetteSelectionnee">
              <p><strong>Titre :</strong> {{ recetteSelectionnee.titre }}</p>
              <p><strong>Ingrédients :</strong> {{ recetteSelectionnee.ingredients }}</p>
              <p><strong>Type :</strong> {{ recetteSelectionnee.type }}</p>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useRecetteStore } from '../../store/recetteStore';

const store = useRecetteStore();
const recetteSelectionnee = ref(null);

const deleteRecette = (id) => {
  store.destroy(id);
};

const voirDetails = (recette) => {
  recetteSelectionnee.value = recette;
 
  // const modal = new bootstrap.Modal(document.getElementById('detailsModal'));
  // modal.show();
};
</script>

<style scoped></style>
