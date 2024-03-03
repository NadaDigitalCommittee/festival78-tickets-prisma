-- CreateTable
CREATE TABLE "PushNotification" (
    "uuid" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "endpoint" TEXT NOT NULL,
    "p256dh" TEXT NOT NULL,
    "auth" TEXT NOT NULL,

    CONSTRAINT "PushNotification_pkey" PRIMARY KEY ("uuid")
);

-- AddForeignKey
ALTER TABLE "PushNotification" ADD CONSTRAINT "PushNotification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;
