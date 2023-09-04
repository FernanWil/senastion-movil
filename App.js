// import * as React from 'react';
// import { Button, Text, View } from 'react-native';
// import { NavigationContainer } from '@react-navigation/native';
// import { createNativeStackNavigator } from '@react-navigation/native-stack';
// import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';

// function DetailsScreen() {
//   return (
//     <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
//       <Text>Detallitos!</Text>
//     </View>
//   );
// }

// function QuejasScreen({ navigation }) {
//   return (
//     <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
//       <Text>Pantalla de casa</Text>
//       {/* <Button/> */}
//     </View>
//   );
// }

// function ComiteScreen() {
//   return(
//     <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
//       <Text>Comite Pantalla</Text>
//     </View>
//   )
// }

// function PlanMScreen() {
//   return(
//     <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
//       <Text>Pantalla de Plan Mejoramiento</Text>
//     </View>
//   )
// }

// function PerfilScreen({ navigation }) {
//   return (
//     <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
//       <Text>configuración screen</Text>
//       {/* <Button title="Mirar detalles" onPress={() => navigation.navigate('Details')}/> */}
//     </View>
//   );
// }

// const QuejasStack = createNativeStackNavigator();

// function QuejasStackScreen() {
//   return (
//     <QuejasStack.Navigator>
//       <QuejasStack.Screen name="Senastion" component={QuejasScreen} />
//       {/* <QuejasStack.Screen name="Details" component={ComiteScreen} /> */}
//     </QuejasStack.Navigator>
//   );
// }

// const ComiteStack = createNativeStackNavigator();
// function ComiteStackScreen() {
//   return(
//     <QuejasStack.Navigator>
//       <ComiteStack.Screen name="Senastion" component={ComiteScreen}/>
//       {/* <ComiteStack.Screen name="Hola" component={PerfilScreen}/> */}
//     </QuejasStack.Navigator>
//   )
// }

// const PlanMStack = createNativeStackNavigator();

// function PlanMStackScreen() {
//   return(
//     <PlanMStack.Navigator>
//       <PlanMStack.Screen name="Senastion" component={PlanMScreen}/>
//     </PlanMStack.Navigator>
//   )
// }

// const PerfilStack = createNativeStackNavigator();

// function PerfilStackScreen() {
//   return (
//     <PerfilStack.Navigator>
//       <PerfilStack.Screen name="Senastion" component={PerfilScreen} />
//       {/* <PerfilStack.Screen name="Details" component={QuejasScreen} /> */}
//     </PerfilStack.Navigator>
//   );
// }

// const Tab = createBottomTabNavigator();

// export default function App() {
//   return (
//     <NavigationContainer>
//       <Tab.Navigator screenOptions={{ headerShown: false }}>
//         <Tab.Screen name="Quejas" component={QuejasStackScreen} />
//         <Tab.Screen name="Comite" component={ComiteStackScreen} />
//         <Tab.Screen name="Plan Mejoramiento" component={PlanMStackScreen} />
//         <Tab.Screen name="Perfil" component={PerfilStackScreen} />
//       </Tab.Navigator>
//     </NavigationContainer>
//   );
// }

import React, { Component } from 'react';
import { Text, View, StyleSheet } from 'react-native';
import Navbar from './src/components/navbar/Barra';
// import {createDrawerNavigator} from 'react-navigation'
// import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
// import Comite from './src/view/comite/comiteE/comiteE';
// import PlanM from './src/view/comite/planMejoramiento/planM';
// import Queja from './src/view/comite/quejas/quejas';

const App = () => {

  return (
  <Navbar />
  );
  ;
}
export default App