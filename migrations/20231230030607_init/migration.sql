/*
  Warnings:

  - You are about to drop the column `resultID` on the `Raffle` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Raffle" DROP COLUMN "resultID";

-- CreateTable
CREATE TABLE "Event" (
    "uuid" TEXT NOT NULL,
    "eventId" INTEGER NOT NULL,
    "timeId" INTEGER NOT NULL,
    "raffleId" TEXT NOT NULL,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("uuid")
);

-- CreateIndex
CREATE UNIQUE INDEX "Event_eventId_timeId_key" ON "Event"("eventId", "timeId");
