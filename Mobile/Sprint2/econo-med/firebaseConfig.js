import { initializeApp } from "firebase/app";
import { initializeAuth, getReactNativePersistence } from "firebase/auth";
import ReactNativeAsyncStorage from "@react-native-async-storage/async-storage";

const firebaseConfig = {
  apiKey: "AIzaSyCuzpnGD6HYax8yYc69gzvAU8seMxWVwJY",
  authDomain: "econo-med.firebaseapp.com",
  projectId: "econo-med",
  storageBucket: "econo-med.appspot.com",
  messagingSenderId: "511621605806",
  appId: "1:511621605806:web:a7037348b447cafe02403f",
  measurementId: "G-R7KP371Z95",
};

export const app = initializeApp(firebaseConfig);
export const auth = initializeAuth(app, {
  persistence: getReactNativePersistence(ReactNativeAsyncStorage),
});
