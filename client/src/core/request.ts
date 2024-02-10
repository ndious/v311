const BASE_URL = 'http://localhost:3000'
const USER = 'dious'

export const search = async (value: string) => {
    const response = await fetch(`${BASE_URL}/s/${value}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "X_User": USER,
      }
    })
    
    return await response.json()
}
