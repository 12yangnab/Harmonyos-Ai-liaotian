
interface ServerResponseDataType {
  code: number,
  message: string,
  data: SystemdDataType
}
interface  SystemdDataType {
  id: number,
  result: string,
}

export default ServerResponseDataType