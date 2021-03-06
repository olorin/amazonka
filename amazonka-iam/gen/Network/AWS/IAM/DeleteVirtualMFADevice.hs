{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IAM.DeleteVirtualMFADevice
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes a virtual MFA device.
--
-- You must deactivate a user\'s virtual MFA device before you can delete
-- it. For information about deactivating MFA devices, see
-- DeactivateMFADevice.
--
-- /See:/ <http://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteVirtualMFADevice.html AWS API Reference> for DeleteVirtualMFADevice.
module Network.AWS.IAM.DeleteVirtualMFADevice
    (
    -- * Creating a Request
      deleteVirtualMFADevice
    , DeleteVirtualMFADevice
    -- * Request Lenses
    , dvmdSerialNumber

    -- * Destructuring the Response
    , deleteVirtualMFADeviceResponse
    , DeleteVirtualMFADeviceResponse
    ) where

import           Network.AWS.IAM.Types
import           Network.AWS.IAM.Types.Product
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteVirtualMFADevice' smart constructor.
newtype DeleteVirtualMFADevice = DeleteVirtualMFADevice'
    { _dvmdSerialNumber :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteVirtualMFADevice' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dvmdSerialNumber'
deleteVirtualMFADevice
    :: Text -- ^ 'dvmdSerialNumber'
    -> DeleteVirtualMFADevice
deleteVirtualMFADevice pSerialNumber_ =
    DeleteVirtualMFADevice'
    { _dvmdSerialNumber = pSerialNumber_
    }

-- | The serial number that uniquely identifies the MFA device. For virtual
-- MFA devices, the serial number is the same as the ARN.
dvmdSerialNumber :: Lens' DeleteVirtualMFADevice Text
dvmdSerialNumber = lens _dvmdSerialNumber (\ s a -> s{_dvmdSerialNumber = a});

instance AWSRequest DeleteVirtualMFADevice where
        type Rs DeleteVirtualMFADevice =
             DeleteVirtualMFADeviceResponse
        request = postQuery iAM
        response
          = receiveNull DeleteVirtualMFADeviceResponse'

instance ToHeaders DeleteVirtualMFADevice where
        toHeaders = const mempty

instance ToPath DeleteVirtualMFADevice where
        toPath = const "/"

instance ToQuery DeleteVirtualMFADevice where
        toQuery DeleteVirtualMFADevice'{..}
          = mconcat
              ["Action" =:
                 ("DeleteVirtualMFADevice" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "SerialNumber" =: _dvmdSerialNumber]

-- | /See:/ 'deleteVirtualMFADeviceResponse' smart constructor.
data DeleteVirtualMFADeviceResponse =
    DeleteVirtualMFADeviceResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteVirtualMFADeviceResponse' with the minimum fields required to make a request.
--
deleteVirtualMFADeviceResponse
    :: DeleteVirtualMFADeviceResponse
deleteVirtualMFADeviceResponse = DeleteVirtualMFADeviceResponse'
