{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Glacier.CreateVault
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- This operation creates a new vault with the specified name. The name of
-- the vault must be unique within a region for an AWS account. You can
-- create up to 1,000 vaults per account. If you need to create more
-- vaults, contact Amazon Glacier.
--
-- You must use the following guidelines when naming a vault.
--
-- -   Names can be between 1 and 255 characters long.
--
-- -   Allowed characters are a-z, A-Z, 0-9, \'_\' (underscore), \'-\'
--     (hyphen), and \'.\' (period).
--
-- This operation is idempotent.
--
-- An AWS account has full permission to perform all operations (actions).
-- However, AWS Identity and Access Management (IAM) users don\'t have any
-- permissions by default. You must grant them explicit permission to
-- perform specific actions. For more information, see
-- <http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html Access Control Using AWS Identity and Access Management (IAM)>.
--
-- For conceptual information and underlying REST API, go to
-- <http://docs.aws.amazon.com/amazonglacier/latest/dev/creating-vaults.html Creating a Vault in Amazon Glacier>
-- and
-- <http://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-put.html Create Vault>
-- in the /Amazon Glacier Developer Guide/.
--
-- <http://docs.aws.amazon.com/amazonglacier/latest/dev/api-CreateVault.html>
module Network.AWS.Glacier.CreateVault
    (
    -- * Request
      CreateVault
    -- ** Request constructor
    , createVault
    -- ** Request lenses
    , cvrqAccountId
    , cvrqVaultName

    -- * Response
    , CreateVaultResponse
    -- ** Response constructor
    , createVaultResponse
    -- ** Response lenses
    , cvrsLocation
    , cvrsStatus
    ) where

import           Network.AWS.Glacier.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Provides options to create a vault.
--
-- /See:/ 'createVault' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cvrqAccountId'
--
-- * 'cvrqVaultName'
data CreateVault = CreateVault'
    { _cvrqAccountId :: !Text
    , _cvrqVaultName :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CreateVault' smart constructor.
createVault :: Text -> Text -> CreateVault
createVault pAccountId_ pVaultName_ =
    CreateVault'
    { _cvrqAccountId = pAccountId_
    , _cvrqVaultName = pVaultName_
    }

-- | The @AccountId@ value is the AWS account ID. This value must match the
-- AWS account ID associated with the credentials used to sign the request.
-- You can either specify an AWS account ID or optionally a single
-- apos@-@apos (hyphen), in which case Amazon Glacier uses the AWS account
-- ID associated with the credentials used to sign the request. If you
-- specify your Account ID, do not include any hyphens (apos-apos) in the
-- ID.
cvrqAccountId :: Lens' CreateVault Text
cvrqAccountId = lens _cvrqAccountId (\ s a -> s{_cvrqAccountId = a});

-- | The name of the vault.
cvrqVaultName :: Lens' CreateVault Text
cvrqVaultName = lens _cvrqVaultName (\ s a -> s{_cvrqVaultName = a});

instance AWSRequest CreateVault where
        type Sv CreateVault = Glacier
        type Rs CreateVault = CreateVaultResponse
        request = putJSON
        response
          = receiveJSON
              (\ s h x ->
                 CreateVaultResponse' <$>
                   (h .#? "Location") <*> (pure (fromEnum s)))

instance ToHeaders CreateVault where
        toHeaders = const mempty

instance ToJSON CreateVault where
        toJSON = const (Object mempty)

instance ToPath CreateVault where
        toPath CreateVault'{..}
          = mconcat
              ["/", toText _cvrqAccountId, "/vaults/",
               toText _cvrqVaultName]

instance ToQuery CreateVault where
        toQuery = const mempty

-- | Contains the Amazon Glacier response to your request.
--
-- /See:/ 'createVaultResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cvrsLocation'
--
-- * 'cvrsStatus'
data CreateVaultResponse = CreateVaultResponse'
    { _cvrsLocation :: !(Maybe Text)
    , _cvrsStatus   :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CreateVaultResponse' smart constructor.
createVaultResponse :: Int -> CreateVaultResponse
createVaultResponse pStatus_ =
    CreateVaultResponse'
    { _cvrsLocation = Nothing
    , _cvrsStatus = pStatus_
    }

-- | The URI of the vault that was created.
cvrsLocation :: Lens' CreateVaultResponse (Maybe Text)
cvrsLocation = lens _cvrsLocation (\ s a -> s{_cvrsLocation = a});

-- | FIXME: Undocumented member.
cvrsStatus :: Lens' CreateVaultResponse Int
cvrsStatus = lens _cvrsStatus (\ s a -> s{_cvrsStatus = a});