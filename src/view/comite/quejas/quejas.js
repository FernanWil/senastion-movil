import React, { Component, useState, useEffect } from 'react';
import { Button, StyleSheet, Text, View, FlatList, SafeAreaView } from 'react-native';
import { get } from '../../../components/api';

// .then((res) => res.json())
// .then((resJson) =>{
//   console.log(resJson)
// })
const Queja = () => {
  const [Quejas, setQuejas] = useState([])
  const GetData = async () => {
    try {
      const dataQuejas = await get('quejas')
      setQuejas(dataQuejas)
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
        Quejas.map(i => (
          <View>
            <Text>{i.idQueja} {i.aprendizQueja.nombre}</Text>
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

export default Queja