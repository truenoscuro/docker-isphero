<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Http;

class EnsureTokenIsValid
{
    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure(Request): (Response|RedirectResponse) $next
     * @return JsonResponse|void
     */
    public function handle(Request $request, Closure $next)
    {
        $token = $request->header('Authorization');
        $bearer = explode(' ', $token);
        if (count($bearer) != 2) return response()->json(['message' => 'Not authorized'], 401);
        $isValid = $this->validateToken($bearer[1]);

        if ($isValid == 1) return $next($request);
        else return response()->json(['message' => 'Invalid token'], 401);
    }

    private function validateToken(?string $token): bool
    {
        $valid = Http::post('http://tomcat:8080/auth/verify', [
            'token' => $token
        ]);

        $responseMessage = $valid->json();
        if ($responseMessage['message'] ?? 'valid') return true;
        else return false;
    }
}
