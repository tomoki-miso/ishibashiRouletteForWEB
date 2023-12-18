import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

const firestore = admin.firestore();

export const updateCouponStatus = functions.pubsub
  .schedule("every day 17:35")
  .timeZone("Asia/Tokyo") // タイムゾーンを指定
  .onRun(async (context) => {
    try {
      const userInfosSnapshot = await firestore.collection("user_info").get();

      const batch = firestore.batch();

      userInfosSnapshot.forEach((doc) => {
        const userInfo = doc.data();

        // 必要な条件をここでチェックして、isCanGetCouponがfalseの場合にtrueに更新
        if (
          !("isCanGetCoupon" in userInfo) ||
          userInfo.isCanGetCoupon === false
        ) {
          const userRef = firestore.collection("user_info").doc(doc.id);
          batch.update(userRef, {isCanGetCoupon: true});
        }
      });

      await batch.commit();
      console.log("Updated coupon statuses successfully.");
      return null;
    } catch (error) {
      console.error("Error updating coupon statuses:", error);
      return null;
    }
  });
