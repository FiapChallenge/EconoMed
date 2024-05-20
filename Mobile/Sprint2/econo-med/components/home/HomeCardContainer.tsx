import Wallet from "@/assets/icons/wallet";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import { useState } from "react";
import {
  ScrollView,
  StyleSheet,
  Text,
  TouchableWithoutFeedback,
  View,
} from "react-native";

export default function HomeCardContainer() {
  const [selected, setSelected] = useState(0);

  return (
    <View
      style={{
        flexDirection: "row",
        alignItems: "center",
      }}
    >
      <View
        style={{
          transform: [{ rotate: "-90deg" }, { translateY: -8 }],
          marginHorizontal: -40,
          flexDirection: "row",

          gap: 12,
        }}
      >
        <View
          style={{
            flexDirection: "row",
            justifyContent: "space-between",
            alignItems: "flex-end",
            gap: 4,
          }}
        >
          <View
            style={{
              width: selected === 1 ? 16 : 6,
              height: 6,
              borderRadius: 8,
              backgroundColor:
                selected === 1 ? COLORS.primary : COLORS.subtleLight,
            }}
          />
          <View
            style={{
              width: selected === 0 ? 16 : 6,
              height: 6,
              borderRadius: 8,
              backgroundColor:
                selected === 0 ? COLORS.primary : COLORS.subtleLight,
            }}
          />
        </View>
        <Text
          style={[
            textStyles.label_medium,
            {
              color: COLORS.black,
            },
          ]}
        >
          Meus Planos
        </Text>
      </View>
      <ScrollView
        nestedScrollEnabled
        showsVerticalScrollIndicator={false}
        decelerationRate={0}
        style={{
          height: 158,
        }}
        contentContainerStyle={{
          gap: 8,
        }}
        snapToAlignment={"center"}
        snapToOffsets={[0, 166]}
        pagingEnabled
        onScroll={(e) => {
          if (e.nativeEvent.contentOffset.y > 83) {
            setSelected(1);
          } else if (e.nativeEvent.contentOffset.y < 83) {
            setSelected(0);
          }
        }}
      >
        <TouchableWithoutFeedback>
          <View style={styles.placeholder}>
            <Wallet color={COLORS.normal} height={36} width={36} />
            <Text style={textStyles.label_large}>Cartão do Convênio</Text>
          </View>
        </TouchableWithoutFeedback>
        <TouchableWithoutFeedback>
          <View style={styles.placeholder}>
            <Wallet color={COLORS.normal} height={36} width={36} />
            <Text style={textStyles.label_large}>Cartão do Convênio 2</Text>
          </View>
        </TouchableWithoutFeedback>
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  placeholder: {
    flexDirection: "row",
    gap: 8,
    height: 158,
    backgroundColor: COLORS.background,
    borderRadius: 24,
    borderWidth: 2,
    borderColor: COLORS.subtleLight,
    justifyContent: "center",
    alignItems: "center",
  },
});
