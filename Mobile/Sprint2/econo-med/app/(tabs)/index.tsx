import HomeCardContainer from "@/components/home/HomeCardContainer";
import HomeSectionContainer from "@/components/home/HomeSectionContainer";
import HomeFastAcessCard from "@/components/home/HomeFastAcessCard";
import HomeGreetingsContainer from "@/components/home/HomeGreetingsContainer";
import { COLORS } from "@/constants/colors";
import { ScrollView, StyleSheet, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import HomeLastAppointmentsCard from "@/components/home/HomeLastAppointmentsCard";
import Wallet from "@/assets/icons/wallet";
import Marker from "@/assets/icons/marker";
import Paper from "@/assets/icons/paper";
import User from "@/assets/icons/user";
import Graph from "@/assets/icons/graph";

export default function TabOneScreen() {
  let version = 2;
  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: COLORS.white }}>
      <ScrollView
        style={{ flex: 1 }}
        contentContainerStyle={{ flexGrow: 1 }}
        showsVerticalScrollIndicator={false}
        nestedScrollEnabled
        scrollEnabled={version === 1}
      >
        <View style={styles.container}>
          <HomeGreetingsContainer />
          <HomeCardContainer />
          <HomeSectionContainer title="ACESSO RÁPIDO" canScroll>
            <HomeFastAcessCard
              nome="hospitais"
              icon={Marker}
              link="/(tabs)/units"
              active
            />
            <HomeFastAcessCard nome="exames" icon={Paper} />
            <HomeFastAcessCard nome="convênio" icon={Wallet} />
            <HomeFastAcessCard nome="artigos" icon={Graph} />
            <HomeFastAcessCard
              nome="perfil"
              icon={User}
              link="/(tabs)/perfil"
            />
          </HomeSectionContainer>
          <HomeSectionContainer
            title="ÚLTIMAS CONSULTAS"
            direction="column"
            canScroll={!(version === 1)}
          >
            <HomeLastAppointmentsCard
              nome="Dra. Angélica Barcelos"
              especialidade1="Ginecologista"
              especialidade2="Obstetra"
              nota={4.9}
              distancia={300}
              image="https://clinicaplenatatuape.com.br/assets/angelica-90a10a4f.webp"
            />
            <HomeLastAppointmentsCard
              nome="Dr. Orlando Barros"
              especialidade1="Angiologista"
              especialidade2="Cirurgião Vascular"
              nota={4.8}
              distancia={500}
              image="https://clinicaplenatatuape.com.br/assets/orlando-enhanced-1de63b0f.webp"
            />
            <HomeLastAppointmentsCard
              nome="Dra. Ana Regina"
              especialidade1="Dermatologista"
              nota={4.7}
              distancia={700}
              image="https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg"
            />
            <HomeLastAppointmentsCard
              nome="Dr. José Carlos"
              especialidade1="Cardiologista"
              nota={4.6}
              distancia={900}
              image="https://img.freepik.com/fotos-premium/medico-homem-adulto-em-pe-no-escritorio-do-hospital_884296-298.jpg"
            />
            <HomeLastAppointmentsCard
              nome="Dra. Maria Eduarda"
              especialidade1="Nutricionista"
              nota={4.5}
              distancia={1100}
              image="https://clinicaimed.com.br/wp-content/uploads/2021/07/Qual-medico-e-indicado-para-o-tratamento-da-covid-imed.jpg"
            />
          </HomeSectionContainer>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: COLORS.white,
    marginHorizontal: 32,
    gap: 32,
  },
  title: {
    fontSize: 20,
    fontWeight: "500",
  },
});
