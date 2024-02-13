-- CreateEnum
CREATE TYPE "Result" AS ENUM ('WIN', 'LOSE', 'PROCESSING');

-- CreateTable
CREATE TABLE "User" (
    "uuid" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "notification" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "User_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "Raffle" (
    "uuid" TEXT NOT NULL,
    "eventId" INTEGER NOT NULL,
    "timeId" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "participants" INTEGER NOT NULL,
    "result" "Result" NOT NULL DEFAULT 'PROCESSING',

    CONSTRAINT "Raffle_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "Event" (
    "uuid" TEXT NOT NULL,
    "eventId" INTEGER NOT NULL,
    "timeId" INTEGER NOT NULL,
    "raffleId" TEXT NOT NULL,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("uuid")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Raffle_eventId_timeId_userId_key" ON "Raffle"("eventId", "timeId", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "Event_eventId_timeId_key" ON "Event"("eventId", "timeId");

-- AddForeignKey
ALTER TABLE "Raffle" ADD CONSTRAINT "Raffle_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;
