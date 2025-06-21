from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/connect', methods=['POST'])
def connect_device():
    data = request.get_json()
    device_ip = data.get("deviceIp")

    if not device_ip:
        return jsonify({"error": "Missing 'deviceIp' in request body"}), 400

    try:
        result = subprocess.run(["adb", "connect", device_ip],
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE,
                                timeout=10)
        output = result.stdout.decode() + result.stderr.decode()
        return jsonify({"output": output})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)
