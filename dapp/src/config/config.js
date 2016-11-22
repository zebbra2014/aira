const ADDR = {}
if (TEST_NET) {
  ADDR.ADDRESS = '0xb35838Dd4dF7d18ad3d61b09d4463D86500d873a'
  ADDR.ADDRESS_BOT = '0xce7acbd1f75c03aaa4f6ad4099f2edd51a1b4309'
  ADDR.ADDRESS_ST = '0xb3afb61beb834242ec01f6bbd6f178cc4860c2bb'
  ADDR.ADDRESS_TE = '0x733976c3245953420a69efae41fd3c7553233710'
} else {
  ADDR.ADDRESS = '0xa3ce9fa0f6b6649e40bc5146082661d5f0ed5d7a'
  ADDR.ADDRESS_BOT = '0xce7acbd1f75c03aaa4f6ad4099f2edd51a1b4309'
  ADDR.ADDRESS_ST = '0xb3afb61beb834242ec01f6bbd6f178cc4860c2bb'
  ADDR.ADDRESS_TE = '0x733976c3245953420a69efae41fd3c7553233710'
}
export const { ADDRESS, ADDRESS_BOT, ADDRESS_ST, ADDRESS_TE } = ADDR
