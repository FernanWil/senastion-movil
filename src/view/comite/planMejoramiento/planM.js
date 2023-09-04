import React, { Component, useState, useEffect } from 'react';
import { Button, StyleSheet, Text, View, FlatList, SafeAreaView } from 'react-native';
import { get } from '../../../components/api';

// .then((res) => res.json())
// .then((resJson) =>{
//   console.log(resJson)
// })
const PlanM = () => {
  const [PlanMejora, setPlanMejora] = useState([])
  const GetData = async () => {
    try {
      const dataPlanes = await get('plan-mejoramiento')
      setPlanMejora(dataPlanes)
    } catch (error) {
      console.log(error)
    }
  }
  useEffect(()=>{
    GetData()
  },[GetData])
  return (
    <SafeAreaView>
      {
        PlanMejora.map(i => (
          <View>
            <Text>{i.idPlanMejoramiento} {i.aprendizPlanMejoramiento.nombre}</Text>
            <Text></Text>
          </View>
        ))
      }
    </SafeAreaView>
  );
}

const style = StyleSheet.create({
  view: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
})

export default PlanM