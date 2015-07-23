{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.ModifySubnetAttribute
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Modifies a subnet attribute.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-ModifySubnetAttribute.html>
module Network.AWS.EC2.ModifySubnetAttribute
    (
    -- * Request
      ModifySubnetAttribute
    -- ** Request constructor
    , modifySubnetAttribute
    -- ** Request lenses
    , msarqMapPublicIPOnLaunch
    , msarqSubnetId

    -- * Response
    , ModifySubnetAttributeResponse
    -- ** Response constructor
    , modifySubnetAttributeResponse
    ) where

import           Network.AWS.EC2.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'modifySubnetAttribute' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'msarqMapPublicIPOnLaunch'
--
-- * 'msarqSubnetId'
data ModifySubnetAttribute = ModifySubnetAttribute'
    { _msarqMapPublicIPOnLaunch :: !(Maybe AttributeBooleanValue)
    , _msarqSubnetId            :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ModifySubnetAttribute' smart constructor.
modifySubnetAttribute :: Text -> ModifySubnetAttribute
modifySubnetAttribute pSubnetId_ =
    ModifySubnetAttribute'
    { _msarqMapPublicIPOnLaunch = Nothing
    , _msarqSubnetId = pSubnetId_
    }

-- | Specify @true@ to indicate that instances launched into the specified
-- subnet should be assigned public IP address.
msarqMapPublicIPOnLaunch :: Lens' ModifySubnetAttribute (Maybe AttributeBooleanValue)
msarqMapPublicIPOnLaunch = lens _msarqMapPublicIPOnLaunch (\ s a -> s{_msarqMapPublicIPOnLaunch = a});

-- | The ID of the subnet.
msarqSubnetId :: Lens' ModifySubnetAttribute Text
msarqSubnetId = lens _msarqSubnetId (\ s a -> s{_msarqSubnetId = a});

instance AWSRequest ModifySubnetAttribute where
        type Sv ModifySubnetAttribute = EC2
        type Rs ModifySubnetAttribute =
             ModifySubnetAttributeResponse
        request = post
        response = receiveNull ModifySubnetAttributeResponse'

instance ToHeaders ModifySubnetAttribute where
        toHeaders = const mempty

instance ToPath ModifySubnetAttribute where
        toPath = const "/"

instance ToQuery ModifySubnetAttribute where
        toQuery ModifySubnetAttribute'{..}
          = mconcat
              ["Action" =: ("ModifySubnetAttribute" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "MapPublicIpOnLaunch" =: _msarqMapPublicIPOnLaunch,
               "SubnetId" =: _msarqSubnetId]

-- | /See:/ 'modifySubnetAttributeResponse' smart constructor.
data ModifySubnetAttributeResponse =
    ModifySubnetAttributeResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ModifySubnetAttributeResponse' smart constructor.
modifySubnetAttributeResponse :: ModifySubnetAttributeResponse
modifySubnetAttributeResponse = ModifySubnetAttributeResponse'