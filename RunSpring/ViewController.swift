//
//  ViewController.swift
//  RunSpring
//
//  Created by Denis Buriakov on 06.04.2022.
//

import Spring

class ViewController: UIViewController {

// MARK: - IB Outlets
    
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet var animationLabel: UILabel!
    
// MARK: - Private properties
       private var animation = Animation.getRandomAnimation()

// MARK: - IB Actions
    
    @IBAction func runAnimationButtonPressed(_ sender: UIButton!) {
           animationLabel.text = animation.description
           
           animationView.animation = animation.name
           animationView.force = CGFloat(animation.force)
           animationView.duration = CGFloat(animation.duration)
           animationView.delay = CGFloat(animation.delay)
           animationView.curve = animation.curve
           animationView.animate()
           
           animation = Animation.getRandomAnimation()
           sender.setTitle("Run \(animation.name)", for: .normal)
       }

}



struct Animation {
    
    let name: String
    let curve: String
    let force: Float
    let duration: Float
    let delay: Float
    
    var description: String {
        return """
        preset: \(name)
        curve: \(curve)
        force: \(String(format: "%.02f", force))
        duration: \(String(format: "%.02f", duration))
        delay: \(String(format: "%.02f", delay))
        """
    }
    
    static func getRandomAnimation() -> Animation {
        return Animation(
            name: ListAnimation.list.animations.randomElement()?.rawValue ?? "shake",
            curve: ListAnimation.list.curves.randomElement()?.rawValue ?? "spring",
            force: Float.random(in: 1...3),
            duration: Float.random(in: 0.3...3),
            delay: Float.random(in: 0.1...0.9)
        )
    }
}

class ListAnimation {
    
    static let list = ListAnimation()
    
    let animations: [Spring.AnimationPreset] = [
        .shake,
        .pop,
        .morph,
        .squeeze,
        .wobble,
        .swing,
        .flipX,
        .flipY,
        .fall,
        .squeezeLeft,
        .squeezeRight,
        .squeezeDown,
        .squeezeUp,
        .slideLeft,
        .slideRight,
        .slideDown,
        .slideUp,
        .fadeIn,
        .fadeOut,
        .fadeInLeft,
        .fadeInRight,
        .fadeInDown,
        .fadeInUp,
        .zoomIn,
        .zoomOut,
        .flash,
    ]
    
    let curves = Spring.AnimationCurve.allCases

}
