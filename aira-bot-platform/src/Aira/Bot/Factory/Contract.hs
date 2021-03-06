-- |
-- Module      :  Aira.Bot.Factory.Contract
-- Copyright   :  Alexander Krupenkin 2016
-- License     :  BSD3
--
-- Maintainer  :  mail@akru.me
-- Stability   :  experimental
-- Portability :  portable
--
-- Aira contract API.
--
module Aira.Bot.Factory.Contract (
    createToken
  , createTokenEther
  ) where

import Network.Ethereum.Web3.Address
import qualified Data.Text as T
import Network.Ethereum.Web3
import Data.Monoid ((<>))
import Data.Text (Text)
import Data.Text.Read
import Aira.Registrar

createToken :: Text
            -> Address
            -> Text
            -> Text
            -> Int
            -> Integer
            -> Web3 Text
createToken contract client name symbol decimals total = do
    builder <- resolve contract
    self    <- resolve "AiraEth.bot"
    let builder_address = "0x" <> toText builder
        self_address    = "0x" <> toText self
        createCall = Call (Just self_address) builder_address Nothing Nothing (Just "0x16345785d8a0000") . Just
        encodedName     = text2data name
        encodedSymbol   = text2data symbol
        createData = "0xb604ad72" <> paddedInt 160
                                  <> paddedInt (160 + (T.length encodedName `div` 2))
                                  <> paddedInt decimals
                                  <> paddedInt total
                                  <> paddedAddr (toText client)
                                  <> encodedName
                                  <> encodedSymbol
      in eth_sendTransaction (createCall createData)

createTokenEther :: Address
                 -> Text
                 -> Text
                 -> Web3 Text
createTokenEther client name symbol = do
    builder <- resolve "BuilderTokenEther.contract"
    self    <- resolve "AiraEth.bot"
    let builder_address = "0x" <> toText builder
        self_address    = "0x" <> toText self
        createCall = Call (Just self_address) builder_address Nothing Nothing (Just "0x16345785d8a0000") . Just
        encodedName     = text2data name
        encodedSymbol   = text2data symbol
        createData = "0x5a9c2724" <> paddedInt 96
                                  <> paddedInt (96 + (T.length encodedName `div` 2))
                                  <> paddedAddr (toText client)
                                  <> encodedName
                                  <> encodedSymbol
      in eth_sendTransaction (createCall createData)
