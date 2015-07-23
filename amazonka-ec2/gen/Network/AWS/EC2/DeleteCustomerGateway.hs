{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.DeleteCustomerGateway
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified customer gateway. You must delete the VPN
-- connection before you can delete the customer gateway.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DeleteCustomerGateway.html>
module Network.AWS.EC2.DeleteCustomerGateway
    (
    -- * Request
      DeleteCustomerGateway
    -- ** Request constructor
    , deleteCustomerGateway
    -- ** Request lenses
    , dcggrqDryRun
    , dcggrqCustomerGatewayId

    -- * Response
    , DeleteCustomerGatewayResponse
    -- ** Response constructor
    , deleteCustomerGatewayResponse
    ) where

import           Network.AWS.EC2.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteCustomerGateway' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dcggrqDryRun'
--
-- * 'dcggrqCustomerGatewayId'
data DeleteCustomerGateway = DeleteCustomerGateway'
    { _dcggrqDryRun            :: !(Maybe Bool)
    , _dcggrqCustomerGatewayId :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteCustomerGateway' smart constructor.
deleteCustomerGateway :: Text -> DeleteCustomerGateway
deleteCustomerGateway pCustomerGatewayId_ =
    DeleteCustomerGateway'
    { _dcggrqDryRun = Nothing
    , _dcggrqCustomerGatewayId = pCustomerGatewayId_
    }

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
dcggrqDryRun :: Lens' DeleteCustomerGateway (Maybe Bool)
dcggrqDryRun = lens _dcggrqDryRun (\ s a -> s{_dcggrqDryRun = a});

-- | The ID of the customer gateway.
dcggrqCustomerGatewayId :: Lens' DeleteCustomerGateway Text
dcggrqCustomerGatewayId = lens _dcggrqCustomerGatewayId (\ s a -> s{_dcggrqCustomerGatewayId = a});

instance AWSRequest DeleteCustomerGateway where
        type Sv DeleteCustomerGateway = EC2
        type Rs DeleteCustomerGateway =
             DeleteCustomerGatewayResponse
        request = post
        response = receiveNull DeleteCustomerGatewayResponse'

instance ToHeaders DeleteCustomerGateway where
        toHeaders = const mempty

instance ToPath DeleteCustomerGateway where
        toPath = const "/"

instance ToQuery DeleteCustomerGateway where
        toQuery DeleteCustomerGateway'{..}
          = mconcat
              ["Action" =: ("DeleteCustomerGateway" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "DryRun" =: _dcggrqDryRun,
               "CustomerGatewayId" =: _dcggrqCustomerGatewayId]

-- | /See:/ 'deleteCustomerGatewayResponse' smart constructor.
data DeleteCustomerGatewayResponse =
    DeleteCustomerGatewayResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteCustomerGatewayResponse' smart constructor.
deleteCustomerGatewayResponse :: DeleteCustomerGatewayResponse
deleteCustomerGatewayResponse = DeleteCustomerGatewayResponse'