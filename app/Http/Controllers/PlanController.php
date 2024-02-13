<?php

namespace App\Http\Controllers;

use App\Models\Plan;
use Illuminate\Http\Request;
use Laravel\Cashier\Billable;

class PlanController extends Controller
{
    use Billable;
    public function index()
    {
        $plans = Plan::get();

        return view("plans", compact("plans"));
    }

    public function show(Plan $plan, Request $request)
    {
        // dd($plan, $request);
        $intent = auth()->user()->createSetupIntent();
        // dd($intent);
        return view("subscription", compact("plan", "intent"));
    }

    public function subscription(Request $request)
    {
        $plan = Plan::find($request->plan);
        // dd($plan);
        // dd($request->plan, $plan->stripe_plan, $request->token );
        $subscription = $request->user()->newSubscription($request->plan, $plan->stripe_plan)
            ->create($request->token);
        if ($subscription) {
            $emailData = [
                'name' => auth()->user()->name,
                'email' => 'faizanraza527@gmail.com',
                'html' => view('mail',get_defined_vars())->render(),
                'subject' => 'Subscription Mail',
            ];

            email($emailData);
        }

        return view("subscription_success");
    }
}
