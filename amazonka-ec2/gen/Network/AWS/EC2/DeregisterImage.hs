{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.DeregisterImage
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Deregisters the specified AMI. After you deregister an AMI, it can\'t be
-- used to launch new instances.
--
-- This command does not delete the AMI.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DeregisterImage.html>
module Network.AWS.EC2.DeregisterImage
    (
    -- * Request
      DeregisterImage
    -- ** Request constructor
    , deregisterImage
    -- ** Request lenses
    , dirqDryRun
    , dirqImageId

    -- * Response
    , DeregisterImageResponse
    -- ** Response constructor
    , deregisterImageResponse
    ) where

import           Network.AWS.EC2.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deregisterImage' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dirqDryRun'
--
-- * 'dirqImageId'
data DeregisterImage = DeregisterImage'
    { _dirqDryRun  :: !(Maybe Bool)
    , _dirqImageId :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeregisterImage' smart constructor.
deregisterImage :: Text -> DeregisterImage
deregisterImage pImageId_ =
    DeregisterImage'
    { _dirqDryRun = Nothing
    , _dirqImageId = pImageId_
    }

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
dirqDryRun :: Lens' DeregisterImage (Maybe Bool)
dirqDryRun = lens _dirqDryRun (\ s a -> s{_dirqDryRun = a});

-- | The ID of the AMI.
dirqImageId :: Lens' DeregisterImage Text
dirqImageId = lens _dirqImageId (\ s a -> s{_dirqImageId = a});

instance AWSRequest DeregisterImage where
        type Sv DeregisterImage = EC2
        type Rs DeregisterImage = DeregisterImageResponse
        request = post
        response = receiveNull DeregisterImageResponse'

instance ToHeaders DeregisterImage where
        toHeaders = const mempty

instance ToPath DeregisterImage where
        toPath = const "/"

instance ToQuery DeregisterImage where
        toQuery DeregisterImage'{..}
          = mconcat
              ["Action" =: ("DeregisterImage" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "DryRun" =: _dirqDryRun, "ImageId" =: _dirqImageId]

-- | /See:/ 'deregisterImageResponse' smart constructor.
data DeregisterImageResponse =
    DeregisterImageResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeregisterImageResponse' smart constructor.
deregisterImageResponse :: DeregisterImageResponse
deregisterImageResponse = DeregisterImageResponse'