{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CloudFront.GetInvalidation
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Get the information about an invalidation.
--
-- <http://docs.aws.amazon.com/AmazonCloudFront/latest/APIReference/GetInvalidation.html>
module Network.AWS.CloudFront.GetInvalidation
    (
    -- * Request
      GetInvalidation
    -- ** Request constructor
    , getInvalidation
    -- ** Request lenses
    , girqDistributionId
    , girqId

    -- * Response
    , GetInvalidationResponse
    -- ** Response constructor
    , getInvalidationResponse
    -- ** Response lenses
    , girsInvalidation
    , girsStatus
    ) where

import           Network.AWS.CloudFront.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | The request to get an invalidation\'s information.
--
-- /See:/ 'getInvalidation' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'girqDistributionId'
--
-- * 'girqId'
data GetInvalidation = GetInvalidation'
    { _girqDistributionId :: !Text
    , _girqId             :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'GetInvalidation' smart constructor.
getInvalidation :: Text -> Text -> GetInvalidation
getInvalidation pDistributionId_ pId_ =
    GetInvalidation'
    { _girqDistributionId = pDistributionId_
    , _girqId = pId_
    }

-- | The distribution\'s id.
girqDistributionId :: Lens' GetInvalidation Text
girqDistributionId = lens _girqDistributionId (\ s a -> s{_girqDistributionId = a});

-- | The invalidation\'s id.
girqId :: Lens' GetInvalidation Text
girqId = lens _girqId (\ s a -> s{_girqId = a});

instance AWSRequest GetInvalidation where
        type Sv GetInvalidation = CloudFront
        type Rs GetInvalidation = GetInvalidationResponse
        request = get
        response
          = receiveXML
              (\ s h x ->
                 GetInvalidationResponse' <$>
                   (parseXML x) <*> (pure (fromEnum s)))

instance ToHeaders GetInvalidation where
        toHeaders = const mempty

instance ToPath GetInvalidation where
        toPath GetInvalidation'{..}
          = mconcat
              ["/2015-04-17/distribution/",
               toText _girqDistributionId, "/invalidation/",
               toText _girqId]

instance ToQuery GetInvalidation where
        toQuery = const mempty

-- | The returned result of the corresponding request.
--
-- /See:/ 'getInvalidationResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'girsInvalidation'
--
-- * 'girsStatus'
data GetInvalidationResponse = GetInvalidationResponse'
    { _girsInvalidation :: !(Maybe Invalidation)
    , _girsStatus       :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'GetInvalidationResponse' smart constructor.
getInvalidationResponse :: Int -> GetInvalidationResponse
getInvalidationResponse pStatus_ =
    GetInvalidationResponse'
    { _girsInvalidation = Nothing
    , _girsStatus = pStatus_
    }

-- | The invalidation\'s information.
girsInvalidation :: Lens' GetInvalidationResponse (Maybe Invalidation)
girsInvalidation = lens _girsInvalidation (\ s a -> s{_girsInvalidation = a});

-- | FIXME: Undocumented member.
girsStatus :: Lens' GetInvalidationResponse Int
girsStatus = lens _girsStatus (\ s a -> s{_girsStatus = a});