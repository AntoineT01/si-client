<template>
  <NavbarConnected />
  <div class="gestionLieu">
    <h1>Gestion des Lieux</h1>
    <div class="add-lieu-button">
      <button @click="showLieuForm">Ajouter un Lieu</button>
    </div>
    <LieuForm
        v-if="showForm"
        :lieu="selectedLieu"
        @saveLieu="saveOrUpdateLieu"
        @closeForm="closeForm"
    />
    <LieuxList
        :lieux="lieux"
        @editLieu="editLieu"
        @deleteLieu="deleteLieu"
    />
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
import axios from "axios";

export default {
  nom: 'GestionLieuxView',
  components: {
    NavbarConnected,
    LieuxList,
    LieuForm,
    LieuEventsList,
    Footer,
  },
  data() {
    return {
      lieux: [],
      showForm: false,
      selectedLieu: null,
      selectedLieuId: null,
    };
  },
  mounted() {
    this.fetchLieux();
  },
  methods: {
    showLieuForm(lieu = null) {
      this.selectedLieu = lieu ? { ...lieu } : { id: null, nom: '', adresse: '' };
      this.showForm = true;
    },
    editLieu(lieu) {
      this.selectedLieu = lieu;
      this.showForm = true;
    },
    async saveOrUpdateLieu(lieu) {
      const isUpdate = lieu.id ? true : false;
      const method = isUpdate ? 'put' : 'post';
      const url = isUpdate ? `http://localhost:8085/lieux/${lieu.id}` : 'http://localhost:8085/lieux';

      // Prépare les données de la requête pour le log
      const requestData = {
        nom: lieu.nom,
        adresse: lieu.adresse,
        capaciteAccueil: lieu.capaciteAccueil,
      };

      // Imprime les détails de la requête Axios
      console.log(`Envoyant une requête ${method.toUpperCase()} à l'URL: ${url}`);
      console.log('Données de la requête:', requestData);

      await axios[method](url, requestData)
          .then(() => {
            this.fetchLieux();
            this.showForm = false;
          })
          .catch(error => console.error("Erreur API :", error));
    },
    async deleteLieu(lieuId) {
      await axios.delete(`http://localhost:8085/lieux/${lieuId}`)
          .then(() => {
            this.fetchLieux();
          })
          .catch(error => {
            if (error.response.status === 404) {
              alert("Le lieu ne peut pas être supprimé. Des évènements sont liés.");
            } else {
              console.error("Erreur API :", error);
            }
          });
    },
    async fetchLieux() {
      await axios.get('http://localhost:8085/lieux')
          .then(response => {
            this.lieux = response.data;
          })
          .catch(error => {
            console.error("Erreur lors de la récupération des lieux :", error);
          });
    },
    closeForm() {
      this.showForm = false;
    },
  },
};
</script>

<style scoped>
/* Le CSS existant reste inchangé */
</style>
