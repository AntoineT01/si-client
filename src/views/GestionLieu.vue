<template>
  <NavbarConnected />
  <div class="gestionLieu">
    <h1>Gestion des Lieux</h1>

    <!-- Bouton pour ajouter un nouveau lieu -->
    <div class="add-lieu-button">
      <button @click="showLieuForm">Ajouter un Lieu</button>
    </div>

    <!-- Formulaire pour ajouter ou éditer un lieu -->
    <LieuForm
        v-if="showForm"
        :lieu="selectedLieu"
        @saveLieu="saveLieu"
        @closeForm="closeForm"
    />
    <!-- Composant pour lister tous les lieux -->
    <LieuxList
        :lieux="lieux"
        @editLieu="editLieu"
        @deleteLieu="deleteLieu"
    />

    <!-- Liste des événements pour un lieu sélectionné -->
    <LieuEventsList
        v-if="selectedLieuId"
        :lieuId="selectedLieuId"
    />
  </div>
  <Footer />
</template>

<script>
import NavbarConnected from '../components/NavbarConnected.vue';
import LieuxList from '../components/LieuxList.vue';
import LieuForm from '../components/LieuxForm.vue';
import LieuEventsList from '../components/LieuxEventList.vue';
import Footer from '../components/Footer.vue';

export default {
  name: 'GestionLieuxView',
  components: {
    NavbarConnected,
    LieuxList,
    LieuForm,
    LieuEventsList,
    Footer,
  },
  data() {
    return {
      lieux: [
        { id: 1, nom: 'Salle de conférence', adresse: '123 Rue Principale, Ville', capaciteAccueil: 100},
        { id: 2, nom: 'Salle de réunion', adresse: '456 Avenue Secondaire, Ville', capaciteAccueil: 50},
        { id: 3, nom: 'Salle de formation', adresse: '789 Boulevard Tertiaire, Ville', capaciteAccueil: 30},
      ],
      showForm: false,
      selectedLieu: null,
      selectedLieuId: null,
    };
  },
  methods: {
    showLieuForm(lieu = null) {
      this.selectedLieu = lieu;
      this.showForm = true;
    },
    editLieu(lieu) {
      this.selectedLieu = lieu;
      this.showForm = true;
    },
    deleteLieu(lieuId) {
      this.lieux = this.lieux.filter(lieu => lieu.id !== lieuId);
    },
    saveLieu(lieu) {
      this.showForm = false;
    },
    closeForm() {
      this.showForm = false;
    },
  },
};
</script>

<style scoped>
.add-lieu-button {
  text-align: center; /* Centre le bouton */
  margin-bottom: 20px; /* Ajoute de l'espace en dessous du bouton */
}

.gestionLieu {
  display: flex;
  flex-direction: column;
  align-items: center; /* Centre le formulaire verticalement */
  justify-content: center; /* Centre le formulaire horizontalement */
  margin-bottom: 20px; /* Ajoute de l'espace en dessous du formulaire */
  padding-bottom: 100px; /* Ajoute de l'espace pour le bouton */

}

</style>

