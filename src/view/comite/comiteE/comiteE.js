import React, { Component, useState, useEffect } from 'react';
import { Button, StyleSheet, Text, View, FlatList, SafeAreaView } from 'react-native';
import { get } from '../../../components/api';

// .then((res) => res.json())
// .then((resJson) =>{
//   console.log(resJson)
// })
const Comite = () => {
  const [Comite, setComite] = useState([])
  const GetData = async () => {
    try {
      const dataComite = await get('comite')
      setComite(dataComite)
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
        Comite.map(i => (
          <View>
            <Text>{i.idComite} {i.link}</Text>
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

export default Comite