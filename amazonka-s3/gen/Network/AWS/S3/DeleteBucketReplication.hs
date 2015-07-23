{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.S3.DeleteBucketReplication
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- FIXME: Undocumented operation.
--
-- <http://docs.aws.amazon.com/AmazonS3/latest/API/DeleteBucketReplication.html>
module Network.AWS.S3.DeleteBucketReplication
    (
    -- * Request
      DeleteBucketReplication
    -- ** Request constructor
    , deleteBucketReplication
    -- ** Request lenses
    , dbrrqBucket

    -- * Response
    , DeleteBucketReplicationResponse
    -- ** Response constructor
    , deleteBucketReplicationResponse
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.S3.Types

-- | /See:/ 'deleteBucketReplication' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dbrrqBucket'
newtype DeleteBucketReplication = DeleteBucketReplication'
    { _dbrrqBucket :: BucketName
    } deriving (Eq,Show,Data,Typeable,Generic)

-- | 'DeleteBucketReplication' smart constructor.
deleteBucketReplication :: BucketName -> DeleteBucketReplication
deleteBucketReplication pBucket_ =
    DeleteBucketReplication'
    { _dbrrqBucket = pBucket_
    }

-- | FIXME: Undocumented member.
dbrrqBucket :: Lens' DeleteBucketReplication BucketName
dbrrqBucket = lens _dbrrqBucket (\ s a -> s{_dbrrqBucket = a});

instance AWSRequest DeleteBucketReplication where
        type Sv DeleteBucketReplication = S3
        type Rs DeleteBucketReplication =
             DeleteBucketReplicationResponse
        request = delete
        response
          = receiveNull DeleteBucketReplicationResponse'

instance ToHeaders DeleteBucketReplication where
        toHeaders = const mempty

instance ToPath DeleteBucketReplication where
        toPath DeleteBucketReplication'{..}
          = mconcat ["/", toText _dbrrqBucket]

instance ToQuery DeleteBucketReplication where
        toQuery = const (mconcat ["replication"])

-- | /See:/ 'deleteBucketReplicationResponse' smart constructor.
data DeleteBucketReplicationResponse =
    DeleteBucketReplicationResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteBucketReplicationResponse' smart constructor.
deleteBucketReplicationResponse :: DeleteBucketReplicationResponse
deleteBucketReplicationResponse = DeleteBucketReplicationResponse'