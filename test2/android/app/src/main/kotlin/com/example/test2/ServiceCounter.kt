package com.example.test2

import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.widget.Toast


class ServiceCounter : Service() {
    override fun onStartCommand(intent: Intent, flags: Int, startId: Int): Int {
        print("Tes");
        onTaskRemoved(intent)
        Toast.makeText(
            applicationContext, "This is a Service running in Background",
            Toast.LENGTH_SHORT
        ).show()

        return START_STICKY
    }
    override fun onBind(intent: Intent): IBinder? {
        // TODO: Return the communication channel to the service.
        throw UnsupportedOperationException("Not yet implemented")
    }
    override fun onTaskRemoved(rootIntent: Intent) {
        val restartServiceIntent = Intent(applicationContext, this.javaClass)
        restartServiceIntent.setPackage(packageName)
        startService(restartServiceIntent)
        super.onTaskRemoved(rootIntent)
    }
}