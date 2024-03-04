<template>
  <Navbar />
  <div class="login-container">

    <h1>Connexion</h1>
    <form @submit.prevent="login">
      <div class="form-group">
        <label for="email">E-mail:</label>
        <input type="email" id="email" v-model="user.email" required>
      </div>
      <div class="form-group">
        <label for="password">Mot de passe:</label>
        <input type="password" id="password" v-model="user.password" required>
      </div>
<!--        bouton avec redirection vers la page HommeConnected en type bouton et non routerlink-->
        <button type="submit">Se connecter</button>
        <router-link to="/homeConnected">Connexion</router-link>


    </form>
  </div>
  <Footer />
</template>

<script>
import Navbar from "../components/Navbar.vue";
import Footer from "../components/Footer.vue";

export default {
  name: 'Login',
  components: {
    Navbar,
    Footer
  },
  data() {
    return {
      user: {
        email: '',
        password: '',
      },
    };
  },
  methods: {
    login() {
      // Logique de connexion sera ajoutée plus tard
      alert('Logique de connexion à implémenter.');
    },
  },
};
</script>

<style>
.login-container {
  max-width: 300px;
  margin: 50px auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.form-group {
  margin-bottom: 15px;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
}

.form-group input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

button {
  padding: 10px 20px;
  background-color: #3498db;
  text-align: center;
  border: none;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}
.router-link {
  padding: 10px 20px;
  background-color: #3498db;
  text-align: center;
  border: none;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}

button:hover {
  background-color: #2980b9;
}
</style>
