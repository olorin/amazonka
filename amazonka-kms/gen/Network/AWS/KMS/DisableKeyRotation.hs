{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.KMS.DisableKeyRotation
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Disables rotation of the specified key.
--
-- <http://docs.aws.amazon.com/kms/latest/APIReference/API_DisableKeyRotation.html>
module Network.AWS.KMS.DisableKeyRotation
    (
    -- * Request
      DisableKeyRotation
    -- ** Request constructor
    , disableKeyRotation
    -- ** Request lenses
    , dkrrqKeyId

    -- * Response
    , DisableKeyRotationResponse
    -- ** Response constructor
    , disableKeyRotationResponse
    ) where

import           Network.AWS.KMS.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'disableKeyRotation' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dkrrqKeyId'
newtype DisableKeyRotation = DisableKeyRotation'
    { _dkrrqKeyId :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DisableKeyRotation' smart constructor.
disableKeyRotation :: Text -> DisableKeyRotation
disableKeyRotation pKeyId_ =
    DisableKeyRotation'
    { _dkrrqKeyId = pKeyId_
    }

-- | A unique identifier for the customer master key. This value can be a
-- globally unique identifier or the fully specified ARN to a key.
--
-- -   Key ARN Example -
--     arn:aws:kms:us-east-1:123456789012:key\/12345678-1234-1234-1234-123456789012
-- -   Globally Unique Key ID Example -
--     12345678-1234-1234-1234-123456789012
dkrrqKeyId :: Lens' DisableKeyRotation Text
dkrrqKeyId = lens _dkrrqKeyId (\ s a -> s{_dkrrqKeyId = a});

instance AWSRequest DisableKeyRotation where
        type Sv DisableKeyRotation = KMS
        type Rs DisableKeyRotation =
             DisableKeyRotationResponse
        request = postJSON
        response = receiveNull DisableKeyRotationResponse'

instance ToHeaders DisableKeyRotation where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("TrentService.DisableKeyRotation" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DisableKeyRotation where
        toJSON DisableKeyRotation'{..}
          = object ["KeyId" .= _dkrrqKeyId]

instance ToPath DisableKeyRotation where
        toPath = const "/"

instance ToQuery DisableKeyRotation where
        toQuery = const mempty

-- | /See:/ 'disableKeyRotationResponse' smart constructor.
data DisableKeyRotationResponse =
    DisableKeyRotationResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DisableKeyRotationResponse' smart constructor.
disableKeyRotationResponse :: DisableKeyRotationResponse
disableKeyRotationResponse = DisableKeyRotationResponse'