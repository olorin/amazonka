{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE LambdaCase         #-}
{-# LANGUAGE OverloadedStrings  #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SSM.Types.Sum
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Network.AWS.SSM.Types.Sum where

import           Network.AWS.Prelude

data AssociationFilterKey
    = AFKInstanceId
    | AFKName
    deriving (Eq,Ord,Read,Show,Enum,Data,Typeable,Generic)

instance FromText AssociationFilterKey where
    parser = takeLowerText >>= \case
        "instanceid" -> pure AFKInstanceId
        "name" -> pure AFKName
        e -> fromTextError $ "Failure parsing AssociationFilterKey from value: '" <> e
           <> "'. Accepted values: InstanceId, Name"

instance ToText AssociationFilterKey where
    toText = \case
        AFKInstanceId -> "InstanceId"
        AFKName -> "Name"

instance Hashable     AssociationFilterKey
instance ToByteString AssociationFilterKey
instance ToQuery      AssociationFilterKey
instance ToHeader     AssociationFilterKey

instance ToJSON AssociationFilterKey where
    toJSON = toJSONText

data AssociationStatusName
    = Failed
    | Pending
    | Success
    deriving (Eq,Ord,Read,Show,Enum,Data,Typeable,Generic)

instance FromText AssociationStatusName where
    parser = takeLowerText >>= \case
        "failed" -> pure Failed
        "pending" -> pure Pending
        "success" -> pure Success
        e -> fromTextError $ "Failure parsing AssociationStatusName from value: '" <> e
           <> "'. Accepted values: Failed, Pending, Success"

instance ToText AssociationStatusName where
    toText = \case
        Failed -> "Failed"
        Pending -> "Pending"
        Success -> "Success"

instance Hashable     AssociationStatusName
instance ToByteString AssociationStatusName
instance ToQuery      AssociationStatusName
instance ToHeader     AssociationStatusName

instance ToJSON AssociationStatusName where
    toJSON = toJSONText

instance FromJSON AssociationStatusName where
    parseJSON = parseJSONText "AssociationStatusName"

data DocumentFilterKey =
    Name
    deriving (Eq,Ord,Read,Show,Enum,Data,Typeable,Generic)

instance FromText DocumentFilterKey where
    parser = takeLowerText >>= \case
        "name" -> pure Name
        e -> fromTextError $ "Failure parsing DocumentFilterKey from value: '" <> e
           <> "'. Accepted values: Name"

instance ToText DocumentFilterKey where
    toText = \case
        Name -> "Name"

instance Hashable     DocumentFilterKey
instance ToByteString DocumentFilterKey
instance ToQuery      DocumentFilterKey
instance ToHeader     DocumentFilterKey

instance ToJSON DocumentFilterKey where
    toJSON = toJSONText

data DocumentStatus
    = Active
    | Creating
    | Deleting
    deriving (Eq,Ord,Read,Show,Enum,Data,Typeable,Generic)

instance FromText DocumentStatus where
    parser = takeLowerText >>= \case
        "active" -> pure Active
        "creating" -> pure Creating
        "deleting" -> pure Deleting
        e -> fromTextError $ "Failure parsing DocumentStatus from value: '" <> e
           <> "'. Accepted values: Active, Creating, Deleting"

instance ToText DocumentStatus where
    toText = \case
        Active -> "Active"
        Creating -> "Creating"
        Deleting -> "Deleting"

instance Hashable     DocumentStatus
instance ToByteString DocumentStatus
instance ToQuery      DocumentStatus
instance ToHeader     DocumentStatus

instance FromJSON DocumentStatus where
    parseJSON = parseJSONText "DocumentStatus"

data Fault
    = Client
    | Server
    | Unknown
    deriving (Eq,Ord,Read,Show,Enum,Data,Typeable,Generic)

instance FromText Fault where
    parser = takeLowerText >>= \case
        "client" -> pure Client
        "server" -> pure Server
        "unknown" -> pure Unknown
        e -> fromTextError $ "Failure parsing Fault from value: '" <> e
           <> "'. Accepted values: Client, Server, Unknown"

instance ToText Fault where
    toText = \case
        Client -> "Client"
        Server -> "Server"
        Unknown -> "Unknown"

instance Hashable     Fault
instance ToByteString Fault
instance ToQuery      Fault
instance ToHeader     Fault

instance FromJSON Fault where
    parseJSON = parseJSONText "Fault"
