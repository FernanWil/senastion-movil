import React, { Component, useState, useEffect } from 'react';
import { Button, StyleSheet, Text, View, FlatList, SafeAreaView } from 'react-native';
import { get } from '../../components/api';

// .then((res) => res.json())
// .then((resJson) =>{
//   console.log(resJson)
// })
const Perfil = () => {
  const [usuarios, setUsuarios] = useState([])
  const GetData = async () => {
    try {
      const dataUsuario = await get('usuarios')
      setUsuarios(dataUsuario)
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
        usuarios.map(i => (
          <View>
            <Text>{i.idUsuario} {i.nombre}</Text>
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

export default Perfil