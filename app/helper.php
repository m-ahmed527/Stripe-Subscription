<?php



function email($data){

    $url = 'https://api.sendinblue.com/v3/smtp/email';
    $apiKey = env('MIAL_API');
    $data = [
        'sender' => [
            'name' => 'Stripe',
            'email' => 'hello@info.com',
        ],
        'to' => [
            ['email' => $data['email']],
            // ['email' => 'recipient2@example.com']
        ],
        'htmlContent' => $data['html'],
        'subject' => $data['subject'],
    ];

    $headers = [
        'Accept: application/json',
        'Content-Type: application/json',
        "api-key: $apiKey"
    ];

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);


    if ($httpCode >= 200 && $httpCode < 300) {
        return ['success' => true, 'message' => 'Email sent successfully'];
    } else {
        return ['success' => false, 'message' => 'Failed to send email', 'response' => $response];
    }
 }


?>
