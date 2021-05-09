// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import CAudioKit

/// This will digitally degrade a signal.
public class BitCrusher: Node {

    let input: Node
    public var connections: [Node] { [input] }
    public var avAudioNode = instantiate2(effect: "btcr")

    // MARK: - Parameters

    /// Specification details for bitDepth
    public static let bitDepthDef = NodeParameterDef(
        identifier: "bitDepth",
        name: "Bit Depth",
        address: akGetParameterAddress("BitCrusherParameterBitDepth"),
        defaultValue: 8,
        range: 1 ... 24,
        unit: .generic)

    /// The bit depth of signal output. Typically in range (1-24). Non-integer values are OK.
    @Parameter(bitDepthDef) public var bitDepth: AUValue

    /// Specification details for sampleRate
    public static let sampleRateDef = NodeParameterDef(
        identifier: "sampleRate",
        name: "Sample Rate (Hz)",
        address: akGetParameterAddress("BitCrusherParameterSampleRate"),
        defaultValue: 10_000,
        range: 0.0 ... 20_000.0,
        unit: .hertz)

    /// The sample rate of signal output.
    @Parameter(sampleRateDef) public var sampleRate: AUValue

    // MARK: - Initialization

    /// Initialize this bitcrusher node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - bitDepth: The bit depth of signal output. Typically in range (1-24). Non-integer values are OK.
    ///   - sampleRate: The sample rate of signal output.
    ///
    public init(
        _ input: Node,
        bitDepth: AUValue = bitDepthDef.defaultValue,
        sampleRate: AUValue = sampleRateDef.defaultValue
        ) {
        self.input = input

        setupParameters()

        self.bitDepth = bitDepth
        self.sampleRate = sampleRate
   }
}
