const get = async (access) => {
    try {
      const response = await fetch(`http://localhost:3000/api/${access}`, {
        method: 'GET'
      })
      const data = await response.json()
      console.log(data)
      return data
    } catch (error) {
      throw error
    }
  }

export {
    get,
}