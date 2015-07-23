{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CognitoIdentity.SetIdentityPoolRoles
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Sets the roles for an identity pool. These roles are used when making
-- calls to @GetCredentialsForIdentity@ action.
--
-- You must use AWS Developer credentials to call this API.
--
-- <http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_SetIdentityPoolRoles.html>
module Network.AWS.CognitoIdentity.SetIdentityPoolRoles
    (
    -- * Request
      SetIdentityPoolRoles
    -- ** Request constructor
    , setIdentityPoolRoles
    -- ** Request lenses
    , siprrqIdentityPoolId
    , siprrqRoles

    -- * Response
    , SetIdentityPoolRolesResponse
    -- ** Response constructor
    , setIdentityPoolRolesResponse
    ) where

import           Network.AWS.CognitoIdentity.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Input to the @SetIdentityPoolRoles@ action.
--
-- /See:/ 'setIdentityPoolRoles' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'siprrqIdentityPoolId'
--
-- * 'siprrqRoles'
data SetIdentityPoolRoles = SetIdentityPoolRoles'
    { _siprrqIdentityPoolId :: !Text
    , _siprrqRoles          :: !(Map Text Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'SetIdentityPoolRoles' smart constructor.
setIdentityPoolRoles :: Text -> SetIdentityPoolRoles
setIdentityPoolRoles pIdentityPoolId_ =
    SetIdentityPoolRoles'
    { _siprrqIdentityPoolId = pIdentityPoolId_
    , _siprrqRoles = mempty
    }

-- | An identity pool ID in the format REGION:GUID.
siprrqIdentityPoolId :: Lens' SetIdentityPoolRoles Text
siprrqIdentityPoolId = lens _siprrqIdentityPoolId (\ s a -> s{_siprrqIdentityPoolId = a});

-- | The map of roles associated with this pool. For a given role, the key
-- will be either \"authenticated\" or \"unauthenticated\" and the value
-- will be the Role ARN.
siprrqRoles :: Lens' SetIdentityPoolRoles (HashMap Text Text)
siprrqRoles = lens _siprrqRoles (\ s a -> s{_siprrqRoles = a}) . _Map;

instance AWSRequest SetIdentityPoolRoles where
        type Sv SetIdentityPoolRoles = CognitoIdentity
        type Rs SetIdentityPoolRoles =
             SetIdentityPoolRolesResponse
        request = postJSON
        response = receiveNull SetIdentityPoolRolesResponse'

instance ToHeaders SetIdentityPoolRoles where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AWSCognitoIdentityService.SetIdentityPoolRoles" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON SetIdentityPoolRoles where
        toJSON SetIdentityPoolRoles'{..}
          = object
              ["IdentityPoolId" .= _siprrqIdentityPoolId,
               "Roles" .= _siprrqRoles]

instance ToPath SetIdentityPoolRoles where
        toPath = const "/"

instance ToQuery SetIdentityPoolRoles where
        toQuery = const mempty

-- | /See:/ 'setIdentityPoolRolesResponse' smart constructor.
data SetIdentityPoolRolesResponse =
    SetIdentityPoolRolesResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'SetIdentityPoolRolesResponse' smart constructor.
setIdentityPoolRolesResponse :: SetIdentityPoolRolesResponse
setIdentityPoolRolesResponse = SetIdentityPoolRolesResponse'